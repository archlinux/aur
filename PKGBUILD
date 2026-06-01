# Maintainer: John Peter Sa <johnpetersa19@proton.me>
pkgname=pkgbuild-manager
_pkgname=PKGBUILD_Manager
pkgver=2.1.0
pkgrel=1
pkgdesc="Rust CLI + GTK4 settings panel and multi-file-manager context-menu integration for PKGBUILD management"
arch=('x86_64')
url="https://github.com/johnpetersa19/PKGBUILD_Manager"
license=('GPL-3.0-or-later')
depends=(
  'pacman-contrib'
  'libnotify'
  'nautilus'
  'python-nautilus'
  'python-gobject'
)
makedepends=('git' 'meson' 'ninja' 'rust' 'cargo' 'gettext')
optdepends=(
  'namcap: for auditing package metadata and structure'
  'shellcheck: for linting PKGBUILD bash code'
  'nemo-python: for Nemo (Cinnamon) right-click menu support'
  'caja-python: for Caja (MATE) right-click menu support'
  'dolphin: for Dolphin (KDE) right-click menu support'
)
provides=("pkgbuild-manager")
conflicts=("pkgbuild-manager-git")
install=pkgbuild-manager.install
source=("$_pkgname-$pkgver.tar.gz::https://github.com/johnpetersa19/PKGBUILD_Manager/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('3f1e5024e01514bfa26c403c8edc1e6d0fade5de0c8f2613aa1d14b9e3d35817')

build() {
  arch-meson "$_pkgname-$pkgver" build
  meson compile -C build
}

package() {
  meson install -C build --destdir="$pkgdir"
}
