# Maintainer : Marcos Heredia <chelqo@gmail.com>
# Contributor: Joris Steyn <jorissteyn@gmail.com>
# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: Roman Kyrylych <roman@archlinux.org>
# Contributor: orelien <aurelien.foret@wanadoo.fr>
# Contributor: Muflone <webreg@vbsimple.net>

pkgname=httrack
pkgver=3.48.21
pkgrel=2
pkgdesc="An easy-to-use offline browser utility."
arch=('i686' 'x86_64')
url="http://www.httrack.com/"
license=('GPL')
depends=('bash' 'xdg-utils' 'hicolor-icon-theme' 'openssl')
options=('!libtool')
install="$pkgname.install"
source=("http://mirror.httrack.com/historical/$pkgname-$pkgver.tar.gz")
md5sums=('c2a2f44da400fe18fad6f98bac49a987')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --enable-static=no
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  _docdir=${pkgdir}/usr/share/doc/${pkgname}
  _licdir=${pkgdir}/usr/share/licenses/${pkgname}
  install -dpm755 ${_docdir} ${_licdir}
  install -Dpm644 AUTHORS INSTALL* README ${_docdir}/
  install -Dpm644 COPYING license.txt ${_licdir}/
}
