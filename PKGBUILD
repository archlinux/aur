# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Contributor: Nuno Araujo <nuno.araujo at russo79.com>
# Contributor: Charles Lindsay <charles@chaoslizard.org>
# Contributor: Alexsandr Pavlov <kidoz at mail dot ru>
# Contributor: Davi da Silva Böger <dsboger@gmail.com>

pkgname=gcdemu
pkgver=3.2.0
pkgrel=1
pkgdesc="GNOME panel applet controlling cdemu-daemon"
arch=('any')
url="http://cdemu.sourceforge.net/"
license=('GPL2')
depends=('cdemu-daemon' 'python-gobject' 'gtk3')
optdepends=('libnotify' 'libappindicator-gtk3')
makedepends=('cmake' 'intltool')
source=("http://downloads.sourceforge.net/cdemu/$pkgname-$pkgver.tar.bz2")
sha512sums=('61a1775c874c9c3604ce88758039ef80b262463ae180e791eb545811fa2176e4bf07c4dbcd3be5f17d446fdef92317a0ff64ce8d27f26aeaeee9d8134b6a95ea')

build() {
    mkdir "$srcdir/build"
    cd "$srcdir/build"
    cmake -DPOST_INSTALL_HOOKS=off -DCMAKE_INSTALL_PREFIX=/usr ../"$pkgname-$pkgver"
    make
}

package() {
    cd "$srcdir/build"
    make DESTDIR="$pkgdir" install
}
