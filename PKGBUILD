# Maintainer: redstrate <josh@redstrate.com>

pkgname=astra-launcher
pkgver=0.3.1
pkgrel=1
pkgdesc="A cross-platform FFXIV launcher"
arch=('x86_64')
url="https://git.sr.ht/~redstrate/astra"
license=('GPL3')
depends=('qt5-base' 'quazip-qt5' 'qtkeychain-qt5' 'libxcomposite') # this x11 dependency is going to be removed in a future release
makedepends=('cmake')
source=("$pkgname-$pkgver::https://git.sr.ht/~redstrate/astra/archive/v$pkgver-beta.tar.gz") # sorry about the -beta on tags, this will be removed in the near future
sha256sums=('3816d6b69faa98b4b7ed0f2dbcb5922b6d8e5b7cb9555ff0a4dfa51372fa0d69')

build() {
	cd "astra-v$pkgver-beta"
    cmake -DCMAKE_BUILD_TYPE=Release ./
    cmake --build ./
}

package() {
    cd "astra-v$pkgver-beta"
    cmake -DCMAKE_INSTALL_PREFIX="$pkgdir/usr"
    make install
    find "$pkgdir" -type d -name ".git" -exec rm -r '{}' +
}

