# Maintainer: redstrate <josh@redstrate.com>
pkgname=astra-launcher
pkgver=v0.3.1
pkgrel=1
pkgdesc="A cross-platform FFXIV launcher"
arch=('x86_64')
url="https://git.sr.ht/~redstrate/astra"
license=('GPL3')
depends=('qt5-base' 'quazip-qt5' 'qtkeychain-qt5' 'libxcomposite') # this x11 dependency is going to be removed in a future release
makedepends=('git' 'cmake')
install=
source=(https://git.sr.ht/~redstrate/astra/archive/$pkgver-beta.tar.gz) # sorry about the -beta on tags, this will be removed in the near future
md5sums=('306b4578140b8ee9cc8133af11fc973f')

build() {
	cd "astra-$pkgver-beta"
    cmake -DCMAKE_BUILD_TYPE=Release ./
    cmake --build ./
}

package() {
    cd "astra-$pkgver-beta"
    cmake -DCMAKE_INSTALL_PREFIX="$pkgdir/usr"
    make install
    find "$pkgdir" -type d -name ".git" -exec rm -r '{}' +
}

