# Maintainer: Niklas Fiekas <niklas at lichess.org>

pkgname=remote-uci
pkgver=1.0.0.alpha2
pkgrel=1
pkgdesc='Use external UCI engines for analysis on lichess.org'
arch=(any)
url=https://github.com/lichess-org/external-engine
license=(GPL3)
makedepends=(rust)
depends=(coreutils stockfish)
install=remote-uci.install
source=("git+$url#tag=v1.0.0-alpha.2"
        remote-uci.sysusers)
sha256sums=(SKIP
            cb63428fa11f3b60fff3d306283902d471889fca088ddf3f186ade195d00851c)

build() {
  cd external-engine/remote-uci
  cargo build --release
}

package() {
  install -Dm755 external-engine/remote-uci/target/release/remote-uci -t "$pkgdir/usr/bin"
  install -Dm644 "$srcdir/remote-uci.sysusers" "$pkgdir/usr/lib/sysusers.d/remote-uci.conf"
  cp -R external-engine/remote-uci/usr "$pkgdir/"
}
