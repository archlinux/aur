# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=mpv-mpris-git
pkgver=0.9.1.ged9f36b
pkgrel=1
pkgdesc="MPRIS plugin for mpv. (GIT version)"
arch=('x86_64')
license=('MIT')
url='https://github.com/hoyon/mpv-mpris'
depends=('mpv'
         'glib2'
         )
makedepends=('git')
checkdepends=('jq'
              'playerctl'
              'socat'
              'sound-theme-freedesktop'
              'xorg-server-xvfb'
              )
provides=('mpv-mpris')
conflicts=('mpv-mpris')
source=('git+https://github.com/hoyon/mpv-mpris.git')
sha256sums=('SKIP')
install=mpv-mpris-git.install

pkgver() {
  cd mpv-mpris
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  sed '110i--no-config \\' -i mpv-mpris/test/setup
}

build() {
  cd mpv-mpris
  make
}

check() {
  cd mpv-mpris
  make test
}

package() {
  cd mpv-mpris
  install -Dm755 mpris.so "${pkgdir}/usr/share/mpv/scripts/mpris.so"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
