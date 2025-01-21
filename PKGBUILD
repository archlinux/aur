# Maintainer: Ariel Lieberman <rellieberman at gmail dot com>
# Contributor: Jay Berry
#This package conflicts with culmus because it contains all culmus fonts as well.

#If you find other conflicts you can remove those fonts from this PKGBUILD,
#see the last line and an example were I removed Liberation fonts since they are contained in other packages.

pkgname=opensiddur-hebrew-fonts
pkgver=20240803
pkgrel=1

# version scheme changed to be by date
epoch=1

pkgdesc="The Open Siddur Project's Unicode Hebrew font pack.
A large collection of open source Hebrew fonts, as well as a few for Latin, Greek, Cyrillic, Arabic, and Amharic"

url="https://github.com/aharonium/fonts"
arch=(any)
license=('GPL3'
          'GPL-FE'
          'custom:OFL'
          'APACHE'
          'UBL'
          'LPPL'
          'GPL2')
depends=()

#Confling packages whos fonts are contained in oppensiddur-hebrew-fonts
conflicts=('culmus'
           'ttf-sil-ezra'
           'ttf-symbola')
           
_sha=bbde28cbfdb434807d480e3eac5b1ba796c79f47
_zipname="$pkgname-$pkgver"
source=("$_zipname.zip::https://github.com/aharonium/fonts/archive/$_sha.zip")
sha256sums=('293d59fe29f04ec57fd543afc6105736f41bf4ad1f9668ab6658307673b325cf')

prepare() {
	find "${srcdir}" -type f ! -perm 644 -exec chmod 644 {} +
}


package() {
  cd "${srcdir}"

  mkdir "${pkgdir}/usr/"
  mkdir "${pkgdir}/usr/share/"
  mkdir "${pkgdir}/usr/share/fonts/"
  mkdir "${pkgdir}/usr/share/fonts/TTF/"
  mkdir "${pkgdir}/usr/share/fonts/OTF/"  

  find "${srcdir}" -type f  -name "*.ttf" -exec cp "{}" "${pkgdir}/usr/share/fonts/TTF/" ";"
  find "${srcdir}" -type f  -name "*.otf" -exec cp "{}" "${pkgdir}/usr/share/fonts/OTF/" ";"
   
 #remove Liberation to prevent conflict
  find "${pkgdir}" -type f -name "Liberation*" -exec rm "{}" ";"
  
 #install custom licences
  install -Dm644 "${srcdir}/fonts-${_sha}/LICENSES.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

 #remove other font families buy running:
 # find "${pkgdir}" -type f -name "<font-family>*" -exec rm "{}" ";"
}
    
