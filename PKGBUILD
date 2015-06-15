# Maintainer: Aleksander Boiko <brdcom@ya.ru>
pkgname=bginetaccounting
_basename=bgbilling
_pkgname=BGInetAccounting
_major=6.1
_minor=22
pkgver=$_major.$_minor
pkgrel=2
pkgdesc="Accounting server for BGBilling"
arch=('i686' 'x86_64') 
url="http://bgbilling.ru"
license=('custom')
depends=('bgbilling')
makedepends=('unzip' 'dos2unix')
source=("ftp://bgbilling.ru/pub/${_basename}/${_major}/data/${_pkgname}_${_major}_${_minor}.zip"
        'bginetaccounting.service'
        'setenv.sh.patch')

package() {
  install -d -m0755 ${pkgdir}/opt
  mv ./${_pkgname} ${pkgdir}/opt/${pkgname}

  install -D -m 644 $pkgname.service "$pkgdir/usr/lib/systemd/system/$pkgname.service"
  
# putting the appropriate access rights to the startup scripts
  cd ${pkgdir}/opt/${pkgname}
  chmod 0744 *.sh

# patch
  patch -p0 <"${srcdir}/setenv.sh.patch"

# converting files to Unix format
  dos2unix *.sh

# remove win files
  rm -rf *.ini
  rm -rf *.bat
  rm -rf *.exe

# remove junk files
  rm -rf ./script
}

# vim:set ts=2 sw=2 ft=sh et:
md5sums=('d64d30fc7fc20d70b152005151d3d3b2'
         'd16caf1cc2f0701d3e4625ce21075a50'
         'dae4f113fa23e562270e1d935a2a3a12')
