# Maintainer: Sam Burgos <santiago.burgos1089@gmail.com>
# Contributor: Jonathon Fernyhough <jonathon+m2x@dev>
# Contributor: Leo <olorin12+gmail+com>
# Contributor: Luna Jernberg <droidbittin@gmail.com>

pkgname=hypnotix
pkgver=4.9
pkgrel=1
pkgdesc="An IPTV streaming application with support for live TV, movies and series."
arch=('any')
url="https://github.com/linuxmint/${pkgname}"
license=('GPL-3.0-or-later')
#groups=('x-apps')
depends=(
    'circle-flags'
    'dconf'
    'hicolor-icon-theme'
    'mpv'
    'python-cairo'
    'python-gobject'
    'python-cinemagoer'
    'python-requests'
    'python-setproctitle'
    'python-unidecode'
    'xapp'
    'yt-dlp'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('c482202f3f57187be85374927c0d89cba478fa9fa0752dc0b56d261efbe2f0f8')

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

