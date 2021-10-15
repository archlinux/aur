# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=sedutil-cli
pkgver=1.20.0
pkgrel=2
pkgdesc="DTA sedutil Self encrypting drive software"
url="https://github.com/Drive-Trust-Alliance/sedutil"
license=('GPL3')
depends=(gcc-libs)
arch=('i686' 'x86_64')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
cksums=('2780899707')
sha256sums=('88016b93cbbef98fa6f5c4e6f58e6c871662b6a7f1fc8dc788c8599fa37a44f3')
b2sums=('6eb18b15a00a2555684459f00c59a9ffa1c0a85ab275bfd4de50225e3e7e9990751c7e4065987527f9c9c798c52abb5d45ef2336c72d6ee1c0e06c8a668ca210')

build() {
  cd "sedutil-$pkgver"

  make -C linux/CLI build CONF="Release_$CARCH" \
    CC="${CC:-gcc}" CXX="${CXX:-g++}" \
    CFLAGS="$CFLAGS" CXXFLAGS="$CXXFLAGS"
}

package() {
  cd "sedutil-$pkgver"

  install -Dm0755 "linux/CLI/dist/Release_$CARCH/GNU-Linux/sedutil-cli" "$pkgdir/usr/bin/sedutil-cli"
}
