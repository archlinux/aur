# Maintainer: Bastien Dejean <baskerville@lavabit.com>

_pkgname=sres
pkgname=${_pkgname}-git
pkgver=13
pkgrel=1
pkgdesc='Print the current screen resolution'
arch=('i686' 'x86_64')
url="https://github.com/baskerville/${_pkgname}"
license=('custom:Unlicense')
depends=('libxcb')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git://github.com/baskerville/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    git rev-list --count HEAD
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
