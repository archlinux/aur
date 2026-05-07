# Maintainer: Harsh Sharma <harsh@codelif.in>

pkgname=ytuff
pkgver=1.0.2
pkgrel=1
pkgdesc="Terminal music player for local files and YouTube Music"
arch=('x86_64')
url="https://github.com/life2harsh/ytuff"
license=('GPL-3.0-or-later')
depends=(
  'alsa-lib'
  'ffmpeg'
  'glib2'
  'glibc'
  'gtk3'
  'libgcc'
  'libsoup3'
  'openssl'
  'systemd-libs'
  'webkit2gtk-4.1'
)
makedepends=(
  'cargo'
  'pkgconf'
)
provides=()
conflicts=('ytuff-bin')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/life2harsh/ytuff/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a77d0d8b6af01c4f887ae70471c31717006e26bdd2cd37786a35aa1e8789a71a')

prepare() {
  cd "ytuff-${pkgver}"

  export CARGO_HOME="${srcdir}/cargo-home"
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "ytuff-${pkgver}"

  export CARGO_HOME="${srcdir}/cargo-home"
  export CARGO_TARGET_DIR=target
  cargo build --release
}

package() {
  cd "ytuff-${pkgver}"

  install -Dm755 "target/release/ytuff" "$pkgdir/usr/bin/ytuff"
}
