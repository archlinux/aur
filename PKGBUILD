# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=optivorbis
pkgver=0.1.2
pkgrel=1
pkgdesc="Application for lossless, format-preserving, two-pass optimization and repair of Vorbis data"
arch=('i686' 'x86_64')
url="https://optivorbis.github.io/OptiVorbis/"
license=('AGPL3' 'BSD')
depends=('gcc-libs')
makedepends=('rust')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/OptiVorbis/OptiVorbis/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1bc9c9227f3e6acae080a02892f880dd95e4ab855d53406fe1795d20dc017cff')


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
