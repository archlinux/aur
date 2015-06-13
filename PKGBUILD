# Maintainer: der_FeniX <derfenix@gmail.com>
pkgname=pica-pica-client
_pkgname=pica-pica
pkgver=0.6dev.git540e7dc
pkgrel=1
pkgdesc="Pica Pica is a distributed instant messaging software that employs strong cryptography for communication protection"
arch=('i686' 'x86_64')
url="http://picapica.im/"
license=('BSD')
groups=()
depends=('qt4')
makedepends=('make')
optdepends=('pica-pica-node')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(http://picapica.im/${_pkgname}_${pkgver}.orig.tar.gz
pica-pica-client.desktop)
md5sums=('38bc8ed5d3aed899dc8339045efd9676'
         '12eec102b252188793458cddda5a19ab')


build() {
  cd "$_pkgname-0.6dev"
  MOC=/usr/bin/moc-qt4 UIC=/usr/bin/uic-qt4 ./configure --prefix=/usr --disable-node --disable-menuitem --with-qt-dir=/opt/qt
  make
}

package() {
  cd "$_pkgname-0.6dev"
  make DESTDIR="$pkgdir/" install
  rmdir "$pkgdir/usr/etc"
  rmdir "$pkgdir/usr/share/man/man5"
  rmdir "$pkgdir/usr/share/man/man8"
  rmdir "$pkgdir/usr/share/man"
  mkdir $pkgdir/usr/share/{pixmaps,applications}
  install -m 664 pica-client/*.png $pkgdir/usr/share/pixmaps/
  install -m 664 ../pica-pica-client.desktop $pkgdir/usr/share/applications/
  install -m 0744 -D LICENSE "$pkgdir/usr/share/licenses/pica-pica-client/LICENSE"
}

# vim:set ts=2 sw=2 et:
