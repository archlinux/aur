# Maintainer: Chris Arndt <aur -at- chrisarndt -dot- de>
# Contributor: lykwydchykyn <me at alan d moore dot com>

_reponame=tap-lv2
pkgname=tap-plugins-lv2-git
pkgver=r98.cab6e0d
pkgrel=1
pkgdesc="LV2 port for the TAP (Tom's Audio Processing) plugins"
arch=(i686 x86_64)
url='https://github.com/moddevices/$_reponame'
license=(GPL-2.0-only)
groups=(pro-audio lv2-plugins)
depends=(glibc)
makedepends=(git lv2)
optdepends=('lv2-host: for loading the LV2 plugins')
source=("$_reponame::git+https://github.com/moddevices/$_reponame.git")
sha256sums=('SKIP')

pkgver() {
  cd $_reponame
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $_reponame
  make INSTALL_PATH=/usr/lib/lv2
}

package() {
  cd $_reponame
  make INSTALL_PATH=/usr/lib/lv2 DESTDIR="$pkgdir/" install
}

