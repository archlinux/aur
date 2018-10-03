# Maintainer: Ariel Lieberman <rellieberman at gmail dot com>

#This package conflicts with culmus because it contains all culmus fonts as well.

#If you find other conflicts you can remove those fonts from this PKGBUILD,
#see the last line and an example were I removed Liberation fonts since they are contained in other packages.

pkgname=opensiddur-hebrew-fonts
pkgver=1.18.5
pkgrel=3
pkgdesc="The Open Siddur Project's open-source Unicode Hebrew font pack. 
Open-source licensed Unicode fonts in: Hebrew, Latin, Greek, Cyrillic, Arabic, and Amharic."

url="https://github.com/aharonium/fonts"
arch=(any)
license=('GPL 3.0'
          'GPL-FE'
          'OFL'
          'APACHE'
          'UBL'
          'LPPL'
          'GPL 2.0')
depends=('fontconfig' 'xorg-fonts-alias' 'xorg-font-utils' 'xorg-fonts-encodings')
conflicts=('culmus')
_sha=03548778f3299c52ad1f92405e8a5bad993dcee5
_zipname="$pkgname-$pkgver"
source=("$_zipname.zip::https://github.com/aharonium/fonts/archive/$_sha.zip")
sha256sums=('6ea21bd339f9baa8e1c0added7f85b995ff299025d23d771ba8568ab873febd2')

prepare() {
	find "${srcdir}" -type f ! -perm 644 -exec chmod 644 {} +
}


package() {
  cd $srcdir

  mkdir $pkgdir/usr/
  mkdir $pkgdir/usr/share/
  mkdir $pkgdir/usr/share/fonts/
  mkdir $pkgdir/usr/share/fonts/TTF/
  mkdir $pkgdir/usr/share/fonts/OTF/  

  find "${srcdir}" -type f  -name "*.ttf" -exec cp "{}" $pkgdir/usr/share/fonts/TTF/ ";"
  find "${srcdir}" -type f  -name "*.otf" -exec cp "{}" $pkgdir/usr/share/fonts/OTF/ ";"
   
 #remove Liberation to prevent conflict
  find "${pkgdir}" -type f -name "Liberation*" -exec rm "{}" ";"

 #remove other font families buy running:
 # find "${pkgdir}" -type f -name "<font-family>*" -exec rm "{}" ";"
}
    
