# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: Peter Jung <ptr1337@archlinux.org>
# Contributor: soloturn <soloturn@gmail.com>
# Contributor: Mark Wagie <mark.wagie@proton.me>

pkgname=cosmic-applets-application-volume
pkgver=1.6.0
pkgrel=1
epoch=1
pkgdesc='Applets for COSMIC Panel'
arch=(x86_64)
url=https://github.com/pop-os/cosmic-applets
license=(GPL-3.0-only)
groups=(cosmic)
provides=(cosmic-applets)
conflicts=(cosmic-applets)
replaces=(cosmic-applets)
depends=(
  cosmic-icon-theme
  dbus
  libgcc
  glibc
  libinput
  libpipewire
  libpulse
  libxkbcommon
  systemd-libs
  util-linux
)
makedepends=(
  cargo
  clang
  git
  just
  mold
)
source=(git+https://github.com/AdityaHebballe/cosmic-applets.git#branch=feat/application-volume-stream-groups)
b2sums=('SKIP')

prepare() {
  cd cosmic-applets
  cargo fetch --locked
  sed 's/lto = "fat"/lto = "thin"/' -i Cargo.toml
}

build() {
  cd cosmic-applets
  RUSTFLAGS+=" -C link-arg=-fuse-ld=mold"
  just build-release --frozen
}

package() {
  cd cosmic-applets
  just rootdir="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
