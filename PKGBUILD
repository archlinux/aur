# Maintainer: Parker Reed <parker.l.reed@gmail.com>

_pkgname='new-lg4ff'
pkgname='new-lg4ff-dkms-git'
pkgver=0.5.0.r0.g2092db1
pkgrel=1
pkgdesc="Experimental Logitech force feedback module (DKMS)"
arch=('x86_64')
url="https://github.com/berarma/new-lg4ff"
license=('GPL-2.0-or-later')
depends=('dkms')
makedepends=('git')
conflicts=("${_pkgname}-dkms")
provides=("${_pkgname}-dkms")
source=("git+https://github.com/berarma/new-lg4ff")
md5sums=('SKIP')


pkgver() {
    cd "$srcdir/${_pkgname}"
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "$srcdir/${_pkgname}"
    ver=$(grep -Po '(?<=^PACKAGE_VERSION=")[^"]*' dkms.conf)
    install -dm755 "${pkgdir}/usr/src/${_pkgname}-${ver}"
    cp -r ./* "${pkgdir}/usr/src/${_pkgname}-${ver}/"
    rm -f "${pkgdir}/usr/src/${_pkgname}-${ver}"/{.gitignore,.editorconfig,LICENSE,README.md}
}
