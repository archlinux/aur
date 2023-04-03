# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=optivorbis
pkgver=0.1.3
pkgrel=1
pkgdesc="Application for lossless, format-preserving, two-pass optimization and repair of Vorbis data"
arch=('i686' 'x86_64')
url="https://optivorbis.github.io/OptiVorbis/"
license=('AGPL3' 'BSD')
depends=('gcc-libs')
makedepends=('rust')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/OptiVorbis/OptiVorbis/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7d3431f689b04c8034d4cf9e33a163e99f2be60fef8e3b4e74ab99ff2a82960a')


prepare() {
  cd "OptiVorbis-$pkgver"

  if [ ! -f "Cargo.lock" ]; then
    cargo update
  fi
  cargo fetch
}

check() {
  cd "OptiVorbis-$pkgver"

  #cargo test \
    #--frozen
}

package() {
  cd "OptiVorbis-$pkgver"

  cargo install \
    --locked \
    --no-track \
    --root "$pkgdir/usr" \
    --path "packages/optivorbis_cli"

  install -Dm644 "LICENSE.BSD-3-Clause" -t "$pkgdir/usr/share/licenses/optivorbis"
}
