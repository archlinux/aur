# Maintainer: Sam Burgos <santiago.burgos1089@gmail.com>
# Contributor: Jonathon Fernyhough <jonathon+m2x@dev>
# Contributor: Leo <olorin12+gmail+com>
# Contributor: Luna Jernberg <droidbittin@gmail.com>

pkgname=hypnotix
pkgver=5.4
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
    'xapp-symbolic-icons'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('8eb7991ceeab93096c8a8c9850b2fd920511b52ad13330b1a25fd8488b6fd71f')

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

