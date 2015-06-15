# Maintainer: Aleksandr Boiko <brdcom@ya.ru>
pkgname=bginetaccess
_basename=bgbilling
_pkgname=BGInetAccess
_major=6.1
_minor=23
pkgver=$_major.$_minor
pkgrel=1
pkgdesc="Access server for BGBilling"
arch=('i686' 'x86_64') 
url="http://bgbilling.ru"
license=('custom')
depends=('bgbilling')
makedepends=('unzip' 'dos2unix')
source=("ftp://bgbilling.ru/pub/${_basename}/${_major}/data/${_pkgname}_${_major}_${_minor}.zip"
        'bginetaccess.service'
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
md5sums=('f2bae56657087a2e1e431465e7d96a04'
         'acb8868e7ee91338d3395cc536e2a52a'
         'dae4f113fa23e562270e1d935a2a3a12')
