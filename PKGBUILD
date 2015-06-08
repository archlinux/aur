# Maintainer: pzl <alsoelp@gmail.com>

_pkgname=mx2000drv
pkgname=${_pkgname}-git
pkgver=r82.b6a752c
pkgrel=1
pkgdesc="Perixx MX 2000 II gaming mouse driver"
arch=('any')
url="https://github.com/pzl/mx2000drv"
license=('GPL2')
depends=('libusb')
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
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )

}

package() {
    cd "$srcdir/$_pkgname"
    make PREFIX=/usr DESTDIR="$pkgdir" install
    install -D -m644 doc/LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
