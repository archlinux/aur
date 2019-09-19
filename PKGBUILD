# Maintainer: Thomas Berryhill <oats@oatberry.me>
# Contributor: Bastien Dejean <nihilhill@gmail.com>

_pkgname=xdo
pkgname=${_pkgname}-git
pkgver=0.5.7.r1.g688f10f
pkgrel=1
pkgdesc='Small X utility to perform elementary actions on windows'
arch=('i686' 'x86_64')
url="https://github.com/baskerville/${_pkgname}"
license=('custom:BSD')
depends=('libxcb' 'xcb-util-wm')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+https://github.com/baskerville/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$_pkgname"
    make PREFIX=/usr
}

package() {
    cd "$srcdir/$_pkgname"
    make PREFIX=/usr DESTDIR="$pkgdir" install
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
