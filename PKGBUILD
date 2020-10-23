# Maintainer: PinkCathodeCat <awils_1 atsymbol xsmail dot com>
# Contributor: Tbsc <me in tbscdev point xyz>
# Contributor: VuiMuich <jm dot spam atsymbol gmx dot net>

pkgname=ratslap
pkgver=0.4.1
pkgrel=0
pkgdesc="Community made Linux drivers for Logitech mice (Currently only G300s)"
arch=('i686' 'x86_64')
url="https://gitlab.com/krayon/$pkgname"
license=('GPL2')
depends=('libusb')
makedepends=('git')
provides=('ratslap')
conflicts=('ratslap')
options=()
install=
source=("$pkgname::git+https://gitlab.com/krayon/$pkgname#tag=$pkgver,branch=main")
md5sums=('SKIP')

build() {
	cd "$srcdir/$pkgname"
        make
        cp manpage.1 "$pkgname.1"
        gzip "$pkgname.1"
}

check() {
	true
}

package() {
        cd "$srcdir/$pkgname"
	install -Dm755 "$srcdir/$pkgname/$pkgname" "${pkgdir}/usr/bin/ratslap"
  install -D -g 0 -o 0  -m 0644 "$srcdir/$pkgname/$pkgname.1.gz" "${pkgdir}/usr/share/man/man1/$pkgname.1.gz"
}
