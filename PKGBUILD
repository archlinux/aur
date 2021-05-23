pkgname=pacutils-git
pkgdesc='alpm front-end tools'
url='https://github.com/andrewgregory/pacutils'
pkgver=0.11.0
pkgrel=1
arch=('i686' 'x86_64')
depends=('pacman>=6.0')
makedepends=('git')
conflicts=('pacutils')
provides=("pacutils=$pkgver")
license=('MIT')
source=("$pkgname::git://github.com/andrewgregory/pacutils.git")
sha1sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --tags | sed 's/^v//; s/-/./g'
}


build() {
    cd "$srcdir/$pkgname"
    make SYSCONFDIR=/etc LOCALSTATEDIR=/var
    make doc
}

check() {
    cd "$srcdir/$pkgname"
    make check
}

package() {
    cd "$srcdir/$pkgname"
    make DESTDIR="$pkgdir" PREFIX=/usr install
    install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
