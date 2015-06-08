# Maintainer: max.bra <max dot bra at alice dot it>
# Contributor: davideddu <me at davideddu dot org>

pkgname=scuolabook
pkgver=3.1
pkgrel=3
pkgdesc="ScuolaBook reader for Linux"
arch=('i686' 'x86_64')
url="http://www.scuolabook.it/applicazioni"
license=('custom')
depends=("gstreamer0.10-base" "gtk2" "libpulse" "qt5-svg" "qt5-webkit")

source=(license)
source_i686+=(http://s3.amazonaws.com/scuolabook_support/"$pkgname"_"$pkgver"_i386.deb)
source_x86_64+=(http://s3.amazonaws.com/scuolabook_support/"$pkgname"_"$pkgver"_amd64.deb)
md5sums=('94f26429ae1b95e18457020be1d7dc08')
md5sums_i686=('94a2864189a6e4039cfc66cf30a908da')
md5sums_x86_64=('b6db6055f4abd09ce0f0546402f91e89')

noextract=("$pkgname"_"$pkgver"_amd64.deb "$pkgname"_"$pkgver"_i386.deb)

prepare() {
  cd "$srcdir"
  msg2 "Decompressing Debian package..."
  ar xv "$pkgname"_"$pkgver"_*.deb > /dev/null
  tar -xf data.tar.gz > /dev/null
  tar -xf control.tar.gz > /dev/null
  msg2 "Checking archive integrity..."
  md5sum -c md5sums > /dev/null
}

package() {
  cd "$srcdir"
  install -D -m644 license "${pkgdir}/usr/share/licenses/${pkgname}/license"
  install -dm755 "$pkgdir"/usr/share/{applications,doc,doc/${pkgname},icons}
  install -m644 usr/share/applications/${pkgname}.desktop "$pkgdir"/usr/share/applications/${pkgname}.desktop
  install -m644 usr/share/doc/${pkgname}/changelog.gz "$pkgdir"/usr/share/doc/${pkgname}/changelog.gz
  install -m644 usr/share/doc/${pkgname}/copyright "$pkgdir"/usr/share/doc/${pkgname}/copyright
  install -m644 usr/share/icons/${pkgname}.png "$pkgdir"/usr/share/icons/${pkgname}.png

  cp -dpr --no-preserve=ownership opt "$pkgdir"
}
