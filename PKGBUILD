# Maintainer: pzl <alsoelp@gmail.com>

_pkgname=mx2000drv
pkgname=${_pkgname}-git
pkgver=r89.0bb2530
pkgrel=1
pkgdesc="Perixx MX 2000 II gaming mouse driver"
arch=('any')
url="https://github.com/pzl/mx2000drv"
license=('GPL2')
depends=('libusb' 'hidapi')
makedepends=('git' 'make')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=()
source=('git+https://github.com/pzl/mx2000drv.git')
md5sums=('SKIP')
sha256sums=('SKIP')


build() {
    cd "$srcdir/$_pkgname"
    make PREFIX=/usr
}

pkgver() {
    cd "$srcdir/$_pkgname"
    echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/$_pkgname"
    make PREFIX=/usr DESTDIR="$pkgdir" install
    install -D -m644 doc/LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
