# Maintainer: Harsh Sharma <harsh@codelif.in>

pkgname=ytuff
pkgver=1.0.1
pkgrel=1
pkgdesc="Terminal music player for local files and YouTube Music"
arch=('x86_64')
url="https://github.com/life2harsh/rustplayer"
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
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/life2harsh/rustplayer/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('68a830a9c4c78bb15e1fb4dccaf8ccc498dd2513af769b64907df65812bef7f5')

prepare() {
  cd "rustplayer-${pkgver}"

  export CARGO_HOME="${srcdir}/cargo-home"
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "rustplayer-${pkgver}"

  export CARGO_HOME="${srcdir}/cargo-home"
  export CARGO_TARGET_DIR=target
  cargo build --release
}

package() {
  cd "rustplayer-${pkgver}"

  install -Dm755 "target/release/rustplayer" "$pkgdir/usr/bin/rustplayer"
}
