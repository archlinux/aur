# Maintainer: Eugenio M. Vigo <emvigo@gmail.com>
# Contributor: speps <speps at aur dot archlinux dot org>

pkgname=dianara
pkgver=1.3.4
pkgrel=1
pkgdesc="A Qt pump.io client"
arch=(i686 x86_64)
url="http://dianara.nongnu.org/"
license=('GPL')
depends=('file' 'qjson' 'qoauth' 'qca-ossl')
source=("http://download-mirror.savannah.gnu.org/releases/$pkgname/$pkgname-v$pkgver.tar.gz")
sha256sums=('c258d99f7f2370ed9c91f83761fa7341c086e0626b1083c894c30a9cf3fa6b20')

prepare() {
  cd $pkgname-v$pkgver
  [ -d b ] || mkdir b
}

build() {
  cd $pkgname-v$pkgver/b
  qmake-qt4 ..
  make
}

package() {
  cd $pkgname-v$pkgver

  # bin
  install -Dm755 b/$pkgname \
    "$pkgdir/usr/bin/$pkgname"

  # desktop file
  install -Dm644 $pkgname.desktop \
    "$pkgdir/usr/share/applications/$pkgname.desktop"

  # icons
  install -Dm644 icon/32x32/$pkgname.png \
    "$pkgdir/usr/share/icons/hicolor/32x32/apps/$pkgname.png"
  install -Dm644 icon/64x64/$pkgname.png \
    "$pkgdir/usr/share/icons/hicolor/64x64/apps/$pkgname.png"

  # translations
  install -d "$pkgdir/usr/share/locale"
  install -Dm644 translations/*.qm \
    "$pkgdir/usr/share/locale"

  # man
  install -Dm644 manual/$pkgname.1 \
    "$pkgdir/usr/share/man/man1/$pkgname.1"
}

# vim:set ts=2 sw=2 et:
