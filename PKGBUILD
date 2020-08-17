# Maintainer: Cooper Pierce <cppierce at andrew.cmu.edu>
pkgname='smackage-git'
pkgver=1.4.3.r298
pkgrel=1
pkgdesc="Package Manager for Standard ML"
arch=('x86_64')
url="https://github.com/standardml/smackage"
license=('BSD')
depends=('gmp')
makedepends=('git'
             'mlton')
provides=("${pkgname%-git}")
source=('smackage::git+http://github.com/standardml/smackage.git#branch=master')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "%s" "$(git tag | tail -n1 | cut -c2-).r$(git rev-list --count HEAD)"
}

build() {
    cd "$srcdir/${pkgname%-git}"
    make mlton
}

package() {
    cd "$srcdir/${pkgname%-git}"
    # Install BSD 2-clause license 
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    DESTDIR="$pkgdir/usr/" make install
}
