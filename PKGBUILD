# Maintainer: robertfoster

pkgname=libindy
pkgver=1.4.0
pkgrel=1
pkgdesc="Shared crypto library for Hyperledger Indy components"
arch=(i686 x86_64)
url="https://github.com/hyperledger/indy-crypto"
license=('APACHE')
depends=('libindy-crypto' 'libsodium' 'openssl' 'sqlite3')
makedepends=('cmake' 'pkg-config' 'rust')
source=("https://github.com/hyperledger/indy-sdk/archive/v$pkgver.tar.gz")

build() {
  cd $srcdir/indy-sdk-$pkgver
  cd libindy
  sed -i 's/0.0.14/0.0.16/g' Cargo.toml
  cargo build --release
}

package() {
  cd $srcdir/indy-sdk-$pkgver
  cd libindy
  install -Dm755 target/release/libindy.so "$pkgdir/usr/lib/libindy.so"
  install -d 755 $pkgdir/usr/include/indy/
  cp include/*.h $pkgdir/usr/include/indy/
}

md5sums=('83e64f0d31423cb7210f276857c68edb')
