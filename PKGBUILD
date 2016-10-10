# Maintainer: Icaro Perseo <icaroperseo[at]protonmail[dot]com>

pkgname=qdc
pkgver=1.0.0
pkgrel=1
pkgdesc="Castilian dictionary written using Qt5"
arch=(i686 x86_64)
conflicts=('qrae-git')
url="https://github.com/javierllorente/qdc/"
license=('GPL' 'GPL3')
depends=('hicolor-icon-theme' 'qt5-webkit')
source=("https://github.com/javierllorente/qdc/archive/v1.0.0/qdc-1.0.0.tar.gz")
sha256sums=('2f34c176cba20fb9ce73310ad12e67c6f985766b2797aa38b56bf7089c51863b')

build() {
  cd $pkgname-$pkgver
  qmake qdc.pro
  make
}

package() {
  cd $pkgname-$pkgver

  make INSTALL_ROOT="${pkgdir}" install

  # Desktop file
  install -Dm644 $pkgname.desktop \
    "$pkgdir/usr/share/applications/$pkgname.desktop"

  # Icon
  install -Dm644 icons/$pkgname.png \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/$pkgname.png"

  # Migration bash script (migrate conf files from qRAE to qdc)
  install -Dm644 scripts/migrate.sh \
    "$pkgdir/usr/share/${pkgname}/autostart/migrate.sh"

  # Licenses
  install -Dm644 gpl-2.0.txt \
    "${pkgdir}/usr/share/licenses/${pkgname}/gpl-2.0.txt"
  install -Dm644 gpl-3.0.txt \
    "${pkgdir}/usr/share/licenses/${pkgname}/gpl-3.0.txt"
}

# vim:set ts=2 sw=2 cc=80 et:
