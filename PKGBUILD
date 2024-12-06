# Maintainer: Sam Burgos <santiago.burgos1089@gmail.com>
# Contributor: Jonathon Fernyhough <jonathon+m2x@dev>
# Contributor: Leo <olorin12+gmail+com>
# Contributor: Luna Jernberg <droidbittin@gmail.com>

pkgname=hypnotix
pkgver=4.8
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
sha256sums=('0c20c0c77f1af1c75faf1659dd01a48ecb00cfd58531f78abc8a2b6b6ff8a942')

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

