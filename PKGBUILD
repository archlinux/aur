# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=optivorbis
pkgver=0.3.1
pkgrel=1
pkgdesc="Application for lossless, format-preserving, two-pass optimization and repair of Vorbis data"
arch=('i686' 'x86_64')
url="https://optivorbis.github.io/OptiVorbis/"
license=('AGPL-3.0-or-later' 'BSD-2-Clause')
depends=('glibc' 'libgcc')
makedepends=('cargo')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/OptiVorbis/OptiVorbis/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2416bf529e281040c052e40c57836385a935f2ebfd79eb6430c77cad244182d4')


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
