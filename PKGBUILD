# Maintainer: Harsh Sharma <harsh@codelif.in>

pkgname=ytuff
pkgver=1.0.3
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
sha256sums=('342f0c6aca6cd5ac4eb79cf201ceca51843d8b8fc49e1131498870e32827fc59')

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
