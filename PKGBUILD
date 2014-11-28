# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=ignuit
pkgver=2.20.0
pkgrel=1
pkgdesc="A memorization aid based on the Leitner flashcard system"
arch=('i686' 'x86_64')
url="http://homepages.ihug.co.nz/~trmusson/programs.html#ignuit"
license=('GPL')
depends=('gconf' 'gnome-doc-utils' 'gstreamer0.10-base' 'hicolor-icon-theme' 'intltool' 'libgnomeui' 'libglade' 'libxslt')
install=$pkgname.install
source=(http://homepages.ihug.co.nz/~trmusson/stuff/$pkgname-$pkgver.tar.gz \
        $pkgname.desktop \
        http://homepages.ihug.co.nz/~trmusson/$pkgname/countries_and_capitals-en.xml \
        http://homepages.ihug.co.nz/~trmusson/$pkgname/numbers_days_months-en_ru-without_audio.xml)
sha256sums=('5dc75cef0707677421c272c430cebf5c3730cbcfaeba6428fe14f6bd085d3630'
            '89c160391f5d39b47a9b0ce6dc28080d96acebee356d1a7372a18a8511fea935'
            '60f82b36b02bfa504f5a3f9f0c1c1d96856f675470ecd5fd56dbf4c185e381e7'
            '77523badda6c08af9728f1f45defc04c1c609154cdb285088228f96dc1930191')

build() {
  cd ${srcdir}/$pkgname-$pkgver

  ./configure --prefix=/usr --with-gconf-schema-file-dir=/etc/gconf/schemas
  make
}

package() {
  cd ${srcdir}/$pkgname-$pkgver

  make DESTDIR=${pkgdir} install

  rm -r ${pkgdir}/usr/share/locale

#example files
  install -D -m644 ${srcdir}/countries_and_capitals-en.xml \
    ${pkgdir}/usr/share/$pkgname/examples/countries_and_capitals-en.xml
  install -D -m644 ${srcdir}/numbers_days_months-en_ru-without_audio.xml \
    ${pkgdir}/usr/share/$pkgname/examples/numbers_days_months-en_ru-without_audio.xml

#.desktop file
  install -D -m644 ${srcdir}/$pkgname.desktop \
    ${pkgdir}/usr/share/applications/$pkgname.desktop
}
