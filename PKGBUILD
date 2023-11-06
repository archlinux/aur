# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=nlnetlabs-krill
pkgver=0.14.2
pkgrel=1
pkgdesc="RPKI certificate authority and publication server"
arch=('i686' 'x86_64')
url="https://nlnetlabs.nl/projects/rpki/about/"
license=('MPL2')
depends=('gcc-libs' 'openssl')
makedepends=('rust')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/NLnetLabs/krill/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6779325e95c3c6d991f5184b79969155e6f2df077bf7fd88a21ab8b8cdca7737')


prepare() {
  cd "krill-$pkgver"

  if [ ! -f "Cargo.lock" ]; then
    cargo update
  fi
  cargo fetch
}

check() {
  cd "krill-$pkgver"

  #cargo test \
    #--frozen
}

package() {
  cd "krill-$pkgver"

  cargo install \
    --locked \
    --no-track \
    --root "$pkgdir/usr" \
    --path .
}
