# Maintainer: Albert Graef <aggraef at gmail.com>

pkgname=faustlive-git
pkgver=2.5.11.r1013.5c1b850
pkgrel=1
epoch=2
pkgdesc="A graphical frontend to the Faust compiler."
arch=('i686' 'x86_64')
url="http://faust.grame.fr/"
license=('GPL')
depends=('qt5-base' 'faust' 'jack' 'qrencode' 'libmicrohttpd' 'openssl' 'liblo' 'curl')
makedepends=('git')
provides=('faustlive')
conflicts=('faustlive')
source=("$pkgname::git+https://github.com/grame-cncm/faustlive.git#branch=dev")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  echo $(cat version.txt).r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  cd "$pkgname"
  git submodule update --init
}

build() {
  cd "$pkgname/Build"
  make
}

package() {
  cd "$pkgname"
  install -d "$pkgdir/usr/bin"
  install -d "$pkgdir/usr/share/applications"
  install -d "$pkgdir/usr/share/icons/hicolor/256x256/apps"
  install Build/bin/FaustLive "$pkgdir/usr/bin"
  install Build/rsrc/FaustLive.desktop "$pkgdir/usr/share/applications"
  install Resources/FaustLive.png "$pkgdir/usr/share/icons/hicolor/256x256/apps"
}
