# Maintainer: JP Cimalando <jp-dev@inbox.ru>
pkgname=bambootracker-git
_pkgname=bambootracker
pkgver=v0.1.6.r58.g72627b1
pkgrel=1
epoch=
pkgdesc="YM2608 (OPNA) music tracker"
arch=('x86_64')
url="https://github.com/rerrahkr/BambooTracker"
license=('GPL2')
groups=()
depends=('qt5-multimedia' 'hicolor-icon-theme')
makedepends=('git' 'qt5-tools')
checkdepends=()
optdepends=()
provides=("$_pkgname")
conflicts=("$_pkgname")
replaces=()
backup=()
options=()
install=
changelog=
source=("$_pkgname::git+https://github.com/rerrahkr/BambooTracker.git")
md5sums=('SKIP')
noextract=()
validpgpkeys=()

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname/BambooTracker"
  qmake CONFIG+=release PREFIX=/usr
  make
}

package() {
  cd "$_pkgname"

  install -D -m 644 BambooTracker.desktop "$pkgdir"/usr/share/applications/BambooTracker.desktop
  install -D -m 644 BambooTracker/res/icon/icon_16x16.png "$pkgdir"/usr/share/icons/hicolor/16x16/apps/BambooTracker.png
  install -D -m 644 BambooTracker/res/icon/icon_256x256.png "$pkgdir"/usr/share/icons/hicolor/256x256/apps/BambooTracker.png

  cd "BambooTracker"

  # workaround to create qm install rules
  qmake CONFIG+=release PREFIX=/usr

  make INSTALL_ROOT="$pkgdir" install
}
