# Maintainer: mrxx <mrxx at cyberhome dot at>

pkgname=securefs
pkgver=0.4.3
pkgrel=1
pkgdesc="A better transparent encryption filesystem"
arch=('i686' 'x86_64')
license=('MIT')
depends=('fuse' 'gcc-libs')
makedepends=('git' 'cmake')
source=("https://github.com/netheril96/$pkgname/archive/${pkgver}.tar.gz")
sha1sums=('55076d14949639f13b31f4e7811fe593ad3ec304')

build() {
    cd "$srcdir/$pkgname-${pkgver}"
    mkdir build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr -Dlibdir=/usr/lib ..
    make
}

package() {
    cd "$srcdir/$pkgname-${pkgver}"
    install -Dm755 build/securefs "$pkgdir"/usr/bin/securefs
    install -Dm755 build/securefs_test "$pkgdir"/usr/bin/securefs_test
    install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    install -Dm644 README.md ${pkgdir}/usr/share/doc/${pkgname}/README
}
