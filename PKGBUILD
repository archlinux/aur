# Maintainer: John Peter Sa <johnpetersa19@proton.me>
pkgname=pkgbuild-manager
_pkgname=PKGBUILD_Manager
pkgver=2.3.0
pkgrel=1
pkgdesc="Rust CLI + GTK4 settings panel and multi-file-manager context-menu integration for PKGBUILD management"
arch=('x86_64')
url="https://github.com/johnpetersa19/PKGBUILD_Manager"
license=('GPL-3.0-or-later')
depends=(
  'pacman-contrib'
  'libnotify'
  'python-gobject'
  'gtk4'
  'libadwaita'
)
makedepends=('git' 'meson' 'ninja' 'rust' 'cargo' 'gettext')
optdepends=(
  'namcap: for auditing package metadata and structure'
  'shellcheck: for linting PKGBUILD bash code'
  'python-nautilus: for Nautilus (GNOME) right-click menu support'
  'nemo-python: for Nemo (Cinnamon) right-click menu support'
  'python-caja: for Caja (MATE) right-click menu support'
  'dolphin: for Dolphin (KDE) right-click menu support'
)
provides=("pkgbuild-manager")
conflicts=("pkgbuild-manager-git")
install=pkgbuild-manager.install
source=("$_pkgname-$pkgver.tar.gz::https://github.com/johnpetersa19/PKGBUILD_Manager/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c9e8a2a0e38b731b62632d685ac813a9e53e4a19405894d390a126ed08ecda0d')

build() {
  arch-meson "$_pkgname-$pkgver" build --buildtype=release
  meson compile -C build
}

package() {
  meson install -C build --destdir="$pkgdir"
}
