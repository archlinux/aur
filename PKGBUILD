# Maintainer: q234 rty <q23456yuiop at gmail dot com>
# Contributor: Sam L. Yes <samlukeyes123 at gmail dot com>

_repo_name=waydroid_script
_script=main.py
pkgname=waydroid-script-git
_pkgname=waydroid-script
pkgver=r87.2f4f056
pkgrel=1
pkgdesc="Python Script to add OpenGapps, Magisk, libhoudini translation library and libndk translation library to waydroid"
arch=('any')
url="https://github.com/casualsnek/$_repo_name"
license=('GPL3')
makedepends=('git')
depends=('python-requests' 'python-tqdm' 'dbus-python' 'lzip' 'sqlite' 'waydroid')
optdepends=()
provides=('waydroid-script')
conflicts=('waydroid-script')
source=("git+${url}.git")
md5sums=(SKIP)

prepare() {
    cd ${srcdir}/$_repo_name
    sed -i '1i#!/usr/bin/python' $_script
}

pkgver() {
    cd ${srcdir}/$_repo_name
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd ${srcdir}/$_repo_name
    install -d ${pkgdir}/opt/${_pkgname}
    cp -r * ${pkgdir}/opt/${_pkgname}/
    rm ${pkgdir}/opt/${_pkgname}/{'LICENSE','README.md','requirements.txt'} #LICENSE is already indicated
    chmod +x ${pkgdir}/opt/${_pkgname}/$_script
    install -d ${pkgdir}/usr/bin
    ln -s /opt/${_pkgname}/$_script ${pkgdir}/usr/bin/waydroid-extras
}
