# Maintainer: Ville Aakko <ville.aakko@kapsi.fi>

pkgname="thelasteichhof"
pkgver="2.11W"
pkgrel=1

pkgdesc="The Last Eichhof, a game from 1993, Allegro4 port"

url="https://gitea.com/WildPenguin/TheLastEichhof/"

license=("GPL-3.0-or-later")

arch=('x86_64')

depends=('allegro4' 'glibc')

source=("https://gitea.com/WildPenguin/TheLastEichhof/archive/v${pkgver}.tar.gz")

sha256sums=('acc69cae7ea77d4f759b838535d316448f6fe47c555a78b22949af396b8853db')

build() {
  cd "$srcdir/$pkgname"
  aclocal
  automake --add-missing
  autoconf
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install
  install -Dm644 LICENSE.GPL -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
