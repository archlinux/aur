# Maintainer: lykwydchykyn <me at alan d moore dot com>
pkgname=tap-plugins-lv2-git
pkgver=r95.de26a3c
pkgrel=1
pkgdesc="LV2 port for the TAP (Tom's Audio Processing) plugins"
arch=('i686' 'x86_64')
url="https://github.com/moddevices/tap-lv2"
license=('GPL')
groups=('lv2-plugins')
depends=("glibc")
makedepends=("git" "lv2")
source=("git+https://github.com/moddevices/tap-lv2.git")
md5sums=('SKIP')
_reponame="tap-lv2"


pkgver() {

  cd "${srcdir}"/"${_reponame}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

build() {
  cd "$srcdir/${_reponame}"

  make INSTALL_PATH=/usr/lib/lv2
}

package() {
  cd "$srcdir/${_reponame}"

  make INSTALL_PATH=/usr/lib/lv2 DESTDIR="$pkgdir/" install
}

