# Maintainer: Ariel Lieberman <rellieberman at gmail dot com>

#This package conflicts with culmus because it contains all culmus fonts as well.

#If you find other conflicts you can remove those fonts from this PKGBUILD,
#see the last line and an example were I removed Liberation fonts since they are contained in other packages.

pkgname=opensiddur-hebrew-fonts
pkgver=1.18.4
pkgrel=1
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
_zipname=master
source=("$_zipname.zip::https://github.com/aharonium/fonts/archive/$_zipname.zip")
sha256sums=('SKIP')

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
    
