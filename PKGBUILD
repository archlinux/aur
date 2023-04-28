# Maintainer: Sam Burgos <santiago.burgos1089@gmail.com>
# Contributor: Luna Jernberg <droidbittin@gmail.com>

pkgname=hypnotix-master
pkgver=master.lmde5
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
sha256sums=('6ad75cfaaa47d141dd84fae4b960d21f2b6b10c57e487709d07a90c305bf8736')

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
