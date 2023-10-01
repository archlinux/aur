# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=mpv-mpris-git
pkgver=1.1.0.gf759c86
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

build() {
  cd mpv-mpris
  make
}

check() {
  cd mpv-mpris
  DISPLAY=:0.0 make test
}

package() {
  cd mpv-mpris
  install -Dm755 mpris.so "${pkgdir}/usr/share/mpv/scripts/mpris.so"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
