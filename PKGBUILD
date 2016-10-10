# Maintainer: Icaro Perseo <icaroperseo[at]protonmail[dot]com>
# Contributor: Eugenio M. Vigo <emvigo@gmail.com>
# Contributor: speps <speps at aur dot archlinux dot org>

pkgname=dianara
pkgver=1.3.5
pkgrel=1
pkgdesc="A Qt pump.io client"
arch=(i686 x86_64)
url="http://dianara.nongnu.org/"
license=('GPL')
depends=('file' 'qjson' 'qoauth')
source=("http://download-mirror.savannah.gnu.org/releases/$pkgname/$pkgname-v$pkgver.tar.gz")
sha256sums=('c284fecbb4c0fe00fe2ce7cfd537de42759567c6116f6c16f5b48857ddb73d3e')

build() {
  cd $pkgname-v$pkgver
  qmake-qt4 Dianara.pro
  make
}

package() {
  cd $pkgname-v$pkgver

  make INSTALL_ROOT="${pkgdir}" install

  # Desktop file
  install -Dm644 $pkgname.desktop \
    "$pkgdir/usr/share/applications/$pkgname.desktop"

  # Icons
  install -Dm644 icon/32x32/$pkgname.png \
    "$pkgdir/usr/share/icons/hicolor/32x32/apps/$pkgname.png"
  install -Dm644 icon/64x64/$pkgname.png \
    "$pkgdir/usr/share/icons/hicolor/64x64/apps/$pkgname.png"

  # Translations
  install -d "$pkgdir/usr/share/dianara/translations"
  install -Dm644 translations/*.qm \
    "$pkgdir/usr/share/dianara/translations"

  # Man
  install -Dm644 manual/$pkgname.1 \
    "$pkgdir/usr/share/man/man1/$pkgname.1"

  # License
  install -Dm644 LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 cc=80 et:
