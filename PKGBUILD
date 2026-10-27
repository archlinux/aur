# Maintainer: Witold Adamus <wit3k@users.noreply.gitlab.gnome.org>
#
# Source AUR package: builds client + routine-server from a version tag.
# Uses git+https (GitLab's /-/archive/ tarballs return 406 to curl/makepkg).
# If the name `routine` is taken on AUR, publish as `routine-gnome` instead
# (update pkgname / conflicts / provides accordingly).
#
# After each upstream tag: bump pkgver, makepkg --printsrcinfo.

pkgname=routine
pkgver=0.1.0
pkgrel=1
pkgdesc='GNOME time-blocking client with local routine-server'
url='https://gitlab.gnome.org/wit3k/routine'
arch=('x86_64')
license=('GPL-3.0-or-later')
depends=(
  'gtk4'
  'libadwaita'
  'hicolor-icon-theme'
)
makedepends=(
  'meson'
  'ninja'
  'cargo'
  'rust'
  'pkgconf'
  'protobuf'
  'clang'
  'git'
)
conflicts=('routine-bin')
install=routine.install
options=('!lto')
source=("git+${url}.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
  arch-meson "$srcdir/$pkgname" build \
    --buildtype=release \
    -Dprofile=default \
    -Dapp-id=io.gitlab.wit3k.Routine
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}

# vim: set ts=2 sw=2 et:
