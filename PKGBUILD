# Maintainer: Sam Burgos <santiago.burgos1089@gmail.com>
# Contributor: Jonathon Fernyhough <jonathon+m2x@dev>
# Contributor: Leo <olorin12+gmail+com>

pkgname=hypnotix
pkgver=3.3
pkgrel=1
pkgdesc="An IPTV streaming application with support for live TV, movies and series."
arch=('any')
url="https://github.com/linuxmint/hypnotix"
license=('GPL3')
depends=('dconf' 'hicolor-icon-theme' 'mpv' 'python-cairo' 'python-gobject'
         'python-cinemagoer' 'python-requests' 'python-setproctitle' 'python-unidecode'
         'xapp')
optdepends=('yt-dlp: YouTube channel support')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('7c4a875d0dd29f07976abc7cc9574c9af917effe9733fb668dc7ad939dc0f2ac')

prepare() {
  cd "$pkgname-$pkgver"

  # Set version in About dialog
  sed -i "s/__DEB_VERSION__/${pkgver//+*/}/g" "usr/lib/$pkgname/$pkgname.py"

  # Fix license path
  sed -i 's|common-licenses/GPL|licenses/common/GPL/license.txt|g' \
    "usr/lib/$pkgname/$pkgname.py"
}

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  cp -r usr/ "$pkgdir/"
}

