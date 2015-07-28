# Maintainer: twa022 <twa022 at gmail dot com>

pkgname=kobo-desktop
pkgver=3.0.4
pkgrel=1
pkgdesc="KOBO Desktop for Linux"
arch=(i686 x86_64)
url="http://www.kobo.com"
license=('custom')
if [[ "$CARCH" == 'i686' ]] ; then
	depends=('libzip1' 'libpng12' 'libjpeg6' 'openssl098' 'libusb-compat' 'icu44'
	         'fontconfig' 'libxrender' 'libxext' 'libxml2' 'libsm')
elif [[ "$CARCH" == 'x86_64' ]] ; then
	depends=('lib32-libzip1' 'lib32-libpng12' 'lib32-libjpeg6' 'lib32-openssl098' 
	         'lib32-fontconfig' 'lib32-libxrender' 'lib32-libxext' 'lib32-libusb-compat' 
	         'lib32-libxml2' 'lib32-libsm' 'lib32-icu44')
fi
#source=(http://dl.dropbox.com/u/2183775/kobo-desktop.deb)
source=(https://dl.dropboxusercontent.com/u/17480832/kobo-desktop.deb)

package() {
  cd "$srcdir"
  tar -zxf data.tar.gz -C "$pkgdir"

if [[ "$CARCH" == 'i686' ]] ; then
  sed -i 's|.*LD_LIBRARY_PATH.*|export LD_LIBRARY_PATH=/usr/local/Trolltech/Qt-4.8.0/lib/:/usr/local/Kobo:/usr/lib:$LD_LIBRARY_PATH|' "$pkgdir"/usr/bin/Kobo
elif [[ "$CARCH" == 'x86_64' ]] ; then
  sed -i 's|.*LD_LIBRARY_PATH.*|export LD_LIBRARY_PATH=/usr/local/Trolltech/Qt-4.8.0/lib/:/usr/local/Kobo:/usr/lib32:$LD_LIBRARY_PATH|' "$pkgdir"/usr/bin/Kobo
fi
  mkdir -p "$pkgdir"/usr/lib/udev/rules.d
  mv "$pkgdir"/lib/udev/rules.d/99-kobo.rules "$pkgdir"/usr/lib/udev/rules.d/99-kobo.rules
  rm -r "$pkgdir"/lib
  sed -i 's:Categories=.*:Categories=Office;:' "$pkgdir"/usr/share/applications/Kobo.desktop
}

sha256sums=('da39d435f250ec0ee1b928e7f8976ae979f8f63b491f78ce816b62890bf6c105')
