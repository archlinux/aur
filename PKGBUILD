# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=optivorbis
pkgver=0.3.0
pkgrel=1
pkgdesc="Application for lossless, format-preserving, two-pass optimization and repair of Vorbis data"
arch=('i686' 'x86_64')
url="https://optivorbis.github.io/OptiVorbis/"
license=('AGPL-3.0-or-later' 'BSD-2-Clause')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/OptiVorbis/OptiVorbis/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f1069b35fa24c9b73abb9a28859b84ad0accf968b8892b7a7825decc6c316cd3')


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
