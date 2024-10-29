# Maintainer: a821
# Contributor: agp
# Contributor: Johannes Löthberg
pkgname=pacutils-git
pkgver=0.15.0
pkgrel=1
pkgdesc='Helper tools for libalpm'
url='https://github.com/andrewgregory/pacutils'
arch=('x86_64')
depends=('pacman')
makedepends=('git' 'perl')
conflicts=('pacutils')
provides=("pacutils")
license=('MIT')
source=("git+${url}")
sha1sums=('SKIP')

pkgver() {
    cd pacutils
    git describe --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
    cd pacutils
    make CFLAGS="$CFLAGS $LDFLAGS" SYSCONFDIR=/etc LOCALSTATEDIR=/var
}

check() {
    cd pacutils
    make check
}

package() {
    cd pacutils
    make DESTDIR="$pkgdir" PREFIX=/usr install
    install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
