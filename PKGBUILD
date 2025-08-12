# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=nlnetlabs-krill
pkgver=0.15.0
pkgrel=1
pkgdesc="RPKI certificate authority and publication server"
arch=('i686' 'x86_64')
url="https://nlnetlabs.nl/projects/rpki/about/"
license=('MPL-2.0')
depends=('gcc-libs' 'openssl')
makedepends=('cargo')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/NLnetLabs/krill/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('05cba6db07f610cc48a3d3fc02a3db040027904718e13d8aaad912ee2bc0091b')


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
