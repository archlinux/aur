# Maintainer: mrxx <mrxx at cyberhome dot at>

pkgname=securefs
pkgver=0.4.0
pkgrel=1
pkgdesc="A better transparent encryption filesystem"
arch=('i686' 'x86_64')
url="https://github.com/netheril96/securefs"
license=('MIT')
depends=('fuse' 'gcc-libs-multilib')
makedepends=('git' 'cmake')
source=('git+https://github.com/netheril96/securefs.git')
sha1sums=('SKIP')

build() {
    cd "$srcdir/$pkgname"
    mkdir build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr -Dlibdir=/usr/lib ..
    make -j8
    strip -s securefs
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 build/securefs "$pkgdir"/usr/bin/securefs
    install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    install -Dm644 README.md ${pkgdir}/usr/share/doc/${pkgname}/README
}
