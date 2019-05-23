# Maintainer: Karol Babioch <karol@babioch.de>

pkgname=flamethrower
pkgver=0.10
pkgrel=1
pkgdesc="DNS performance and functional testing utility"
arch=('i686' 'x86_64')
url="https://github.com/DNS-OARC/flamethrower"
license=('APACHE')
depends=('ldns' 'libuv')
makedepends=('cmake')
source=("git+https://github.com/DNS-OARC/flamethrower.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
    cd "${srcdir}/${pkgname}"
    # Fix a issue with CMake package name of ldns
    sed -i 's/libldns/ldns/' CMakeLists.txt
    mkdir -p build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr ..
    make
}

package() {
    cd "${srcdir}/${pkgname}"
    install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm0644 man/flame.1 "$pkgdir/usr/share/man/man1/flame.1"
    cd build
    install -Dm0755 flame "$pkgdir/usr/bin/flame"
}
