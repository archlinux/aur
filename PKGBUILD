# Maintainer: Ville Aakko <wpenguin <AT> kapsi DOT fi>

pkgname="thelasteichhof"
pkgver="2.12w"
pkgrel=1

pkgdesc="A game from 1993, Allegro4 port with experimental minor improvements."

url="https://gitea.com/WildPenguin/TheLastEichhof/"

license=("GPL-3.0-or-later")

arch=('x86_64')

depends=('allegro4' 'glibc')

source=("$pkgname-$pkgver-src.tar.gz"::"https://gitea.com/WildPenguin/TheLastEichhof/archive/v${pkgver}.tar.gz")

sha256sums=('6ad29fdebcb4a69bb9775c992eb04a2f36fa2180f7a7abb5a7c6becbbfee471b')

prepare() {
  cd "$srcdir/$pkgname"
  aclocal
  automake --add-missing
  autoconf
}


build() {
  cd "$srcdir/$pkgname"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
