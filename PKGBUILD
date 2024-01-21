# Maintainer: Imperator Storm <ImperatorStorm11@protonmail.com>
# Contributor: q234 rty <q23456yuiop at gmail dot com>
# Contributor: Sam L. Yes <samlukeyes123 at gmail dot com>

_repo_name=waydroid_script
_script=main.py
pkgname=waydroid-script-git
_pkgname=waydroid-script
pkgver=r142.59547e7
pkgrel=3
pkgdesc="Python Script to add OpenGapps, Magisk, libhoudini translation library and libndk translation library to waydroid"
arch=('any')
url="https://github.com/casualsnek/$_repo_name"
license=(GPL-3.0-only)
makedepends=(git)
depends=(python-requests python-tqdm python-inquirerpy dbus-python lzip sqlite waydroid)
optdepends=()
provides=(waydroid-script)
conflicts=(waydroid-script)
source=("git+${url}.git")
sha256sums=(SKIP)

pkgver() {
    cd ${srcdir}/$_repo_name
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd ${srcdir}/$_repo_name
    install -d ${pkgdir}/opt/${_pkgname}
    cp -r * ${pkgdir}/opt/${_pkgname}/
    chmod +x ${pkgdir}/opt/${_pkgname}/main.py
    install -d ${pkgdir}/usr/bin
    ln -s /opt/${_pkgname}/main.py ${pkgdir}/usr/bin/waydroid-extras
    install -Dm755 ${pkgdir}/opt/${_pkgname}/LICENSE ${pkgdir}/usr/share/licenses/$pkgname/LICENSE
    install -Dm755 ${pkgdir}/opt/${_pkgname}/README.md ${pkgdir}/usr/share/doc/$pkgname/README.md
    rm -rf ${pkgdir}/opt/${_pkgname}/{LICENSE,README.md,requirements.txt,assets}
}
