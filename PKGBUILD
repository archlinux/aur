# Maintainer: Carson Rueter <roachh@protonmail.com>

_pkgname='passmanpp'
pkgname='passman++-lts'
pkgdesc='Incredibly simple and secure command-line password manager. - LTS releases'
url="https://github.com/binex-dsk/$_pkgname/"
license=('BSD')
pkgver=1.4.0p
pkgrel=1
source=("https://github.com/binex-dsk/$_pkgname/archive/$pkgver.tar.gz")
md5sums=('520d88de27f0c8d8ac46d1038b8375ce')
provides=('passman')
conflicts=('passman-git' 'passman++-devel' 'passman++')
depends=('botan' 'libsodium' 'qt5-base' 'ttf-hack')
arch=('x86_64')

build() {
    cd "$srcdir/$_pkgname-$pkgver/src"
    qmake passman.pro
    make && make clean
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    cd "src"
    install -Dm755 passman $pkgdir/usr/bin/passman
}
