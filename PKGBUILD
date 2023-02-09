# Maintainer: Sam Burgos <santiago.burgos1089@gmail.com>
# Contributor: Jonathon Fernyhough <jonathon+m2x@dev>
# Contributor: Leo <olorin12+gmail+com>

pkgname=hypnotix
pkgver=3.2
pkgrel=1
pkgdesc="An IPTV streaming application with support for live TV, movies and series."
arch=('any')
url="https://github.com/linuxmint/hypnotix"
license=('GPL3')
depends=('dconf' 'hicolor-icon-theme' 'mpv' 'python-cairo' 'python-gobject'
         'python-imdbpy' 'python-requests' 'python-setproctitle' 'python-unidecode'
         'xapp')
optdepends=('yt-dlp: YouTube channel support')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('c69906318dfbfd10df055d085afbe271f2e89372faa4c47a649b4827b3a7903c')

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

