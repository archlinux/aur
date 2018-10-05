# Maintainer: Antony Kellermann <aokellermann@gmail.com>

pkgname=tick
pkgver=3.2.0
pkgrel=1
pkgdesc="Command line and GTK stock and cryptocurrency portfolio tracker."
arch=('x86_64')
url="https://github.com/aokellermann/${pkgname}"
license=('MIT')
depends=('curl' 'json-c' 'ncurses' 'gtk3' 'cairo' 'libglade')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("git://github.com/aokellermann/${pkgname}")
md5sums=('SKIP')

build() {
    cd "$srcdir/$pkgname"
    git checkout -q $(git rev-list --tags --max-count=1) # Checks out latest tag instead of latest commit
    CPPFLAGS="$CPPFLAGS -O2"
	make
}

package() {
    cd "$srcdir/$pkgname"
    make DESTDIR="'$pkgdir'/usr" install
}