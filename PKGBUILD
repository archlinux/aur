# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: Peter Jung <ptr1337@archlinux.org>
# Contributor: soloturn <soloturn@gmail.com>
# Contributor: Mark Wagie <mark.wagie@proton.me>

pkgname=cosmic-settings-vrr-fix
pkgver=1.5.0
pkgrel=1
epoch=1
pkgdesc='The settings application for the COSMIC desktop environment (VRR fix)'
arch=(x86_64)
url=https://github.com/skygrango/cosmic-settings
license=(GPL-3.0-only)
groups=(cosmic)
provides=(cosmic-settings)
conflicts=(cosmic-settings)
depends=(
  accountsservice
  adw-gtk-theme
  cosmic-icon-theme
  cosmic-randr
  fontconfig
  libgcc
  glibc
  iso-codes
  libinput
  libpipewire
  libpulse
  libxkbcommon
  networkmanager
  nm-connection-editor
  pipewire-pulse
  systemd-libs
  ttf-opensans
  wayland
)
makedepends=(
  cargo
  clang
  git
  just
  mold
)
optdepends=('power-profiles-daemon: power profiles support')
source=('cosmic-settings::git+https://github.com/skygrango/cosmic-settings.git#branch=vrr_target_rate_v2')
b2sums=('SKIP')

prepare() {
  cd cosmic-settings
  cargo fetch --locked
}

build() {
  cd cosmic-settings
  RUSTFLAGS+=" -C link-arg=-fuse-ld=mold"
  just build-release --frozen
}

package() {
  cd cosmic-settings
  just rootdir="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
