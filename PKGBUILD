# Maintainer: Energi <lukas.bloznelis@gmail.com>

pkgname=krowbar-git
_binname=krowbar
pkgver=1.3.1
pkgrel=1
pkgdesc="BSPWM status bar"
arch=(x86_64)
url="https://github.com/bloznelis/krowbar"
license=(MIT)
groups=()
depends=(gtk4 alsa-lib)
makedepends=(git cargo)
provides=("$_binname")
conflicts=("$_binname")
source=("git+$url")
source=("$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "${_binname}-${pkgver}"
  cargo build --release
}

check() {
  cd "${_binname}-${pkgver}"
  cargo check
}

package() {
  cd "${_binname}-${pkgver}"
  install -Dm755 target/release/$_binname "$pkgdir/usr/bin/$_binname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_binname/"
}
