# Maintainer: Ainola
# Contributor: jorgicio
# Contributor: Vinícius dos Santos Oliveira

pkgname=gnomato
pkgver=1.1.0
pkgrel=3
pkgdesc="A timer for Pomodoro Technique"
arch=(i686 x86_64)
url="https://github.com/diegorubin/gnomato"
license=('GPL3')
depends=('gtkmm3' 'libnotify' 'boost-libs' 'python2' 'sqlite')
makedepends=('intltool' 'gettext' 'boost')
source=(
    "https://github.com/diegorubin/gnomato/archive/$pkgver.tar.gz"
    "fix_sqlite.patch"
)
sha256sums=('450cbddbc36709727774a96cfa319cf70ddce88e442eb75da2ec0b837ce8e44b'
            'fd5adacbc609ccf79ea4577a542f3b7c6611dc7b32aa7d14f439aee150ae1c79')

prepare() {
    patch -d "$srcdir/gnomato-$pkgver/" -p1 < fix_sqlite.patch
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    autoreconf -vi
    ./configure --prefix=/usr
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}
