# Maintainer: 

pkgname=doublecontact
pkgver=0.2.4
pkgrel=1
pkgdesc="Offline DE-independent contact manager primarily for phonebooks editing/merging"
arch=('x86_64')
url="https://github.com/DarkHobbit/doublecontact/"
license=('GPL')
depends=('qt5-base' 'hicolor-icon-theme')
source=(https://github.com/DarkHobbit/${pkgname}/archive/${pkgver}.tar.gz)
sha512sums=('1e9662f23ed11a9fb5a8d3d0d6ede052263dc947ac7aedb1ef5272d2aaf027acfeb2f3158fcf9f447c9d63ceafdfe7b89126c7d04cab1291cd9ab2b98af20398')


build() {
  cd "${pkgname}-${pkgver}"
  qmake-qt5 all.pro
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  install -D -m755 app/doublecontact "${pkgdir}/usr/bin/doublecontact"
  install -D -m755 contconv/contconv "${pkgdir}/usr/bin/contconv"

  # install visuals
  install -D -m644 app/doublecontact.desktop "${pkgdir}/usr/share/applications/doublecontact.desktop"
  install -D -m644 "img/32x32/doublecontact_32x32.png" "${pkgdir}/usr/share/pixmaps/doublecontact_32x32.png"
  for format in {16x16,32x32,64x64,128x128,256x256,512x512}; do
      install -D -m644 "img/${format}/doublecontact_${format}.png" "${pkgdir}/usr/share/icons/hicolor/${format}/apps/doublecontact.png"
  done

  # install translations
  install -D -m644 translations/iso639-1.utf8 "$pkgdir"/usr/share/$pkgname/translations/iso639-1.utf8
  install -D -m644 translations/*.qm -t "$pkgdir"/usr/share/$pkgname/translations/

  # install docs
  install -D -m644 doc/* -t "$pkgdir"/usr/share/$pkgname/doc/
}

