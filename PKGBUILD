# Maintainer: petRUShka <petrushkin {AT} yande {DOT} ru>
pkgname=poker-odds-git
pkgver=39.ab073b1
pkgrel=1
pkgdesc="A poker odds calculator written in Google Go"
arch=('i686' 'x86_64')
url="https://github.com/cmccabe/poker-odds"
license=('GPL2')
depends=()
makedepends=('go' 'git')
source=("${pkgname%-git}::git+https://github.com/cmccabe/poker-odds.git")

sha1sums=('SKIP')

provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")

pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${pkgname%-git}"
#	GOPATH=${srcdir} go get -v
    make
}

package() {
  install -m755 -D "$srcdir/${pkgname%-git}/${pkgname%-git}" $pkgdir/usr/bin/${pkgname%-git}
  install -m644 -D $srcdir/${pkgname%-git}/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
  install -m644 -D $srcdir/${pkgname%-git}/COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING
}
