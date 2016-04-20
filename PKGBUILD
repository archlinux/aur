# Maintainer: Vlad M. <vlad@archlinux.net>
# Contributor: Zhengyu Xu <xzy3186@gmail.com>

pkgname=insync
pkgver=1.3.6
_pkgver=36076
pkgrel=2
pkgdesc="An unofficial Google Drive client that runs on Linux, with support for various desktops"
url="https://www.insynchq.com/downloads"
license=('custom:insync')
options=(!strip !upx)
depends=('xdg-utils' 'glibc' 'python2')
optdepends=('insync-nautilus: file-manager integration for nautilus')
arch=('i686' 'x86_64')
source=('insync.service')
source_i686=("http://s.insynchq.com/builds/${pkgname}_${pkgver}.${_pkgver}-trusty_i386.deb")
source_x86_64=("http://s.insynchq.com/builds/${pkgname}_${pkgver}.${_pkgver}-trusty_amd64.deb")
sha256sums=('995d9131bd454015ff11414d002b8927b7397835969e27061008264c0c5f225d')
sha256sums_i686=('3f98206eaaf303067033b2558882d39672d74e9dfac6bbd496fce761434e71cd')
sha256sums_x86_64=('bf32e4691bbf27bfd4e24bc14a38408a6945469e222b33ce982d81d7d5408d90')

package() {
   tar xvf data.tar.gz
   cp -rp usr $pkgdir

   cd $pkgdir
   for file in $(grep -R "/usr/bin/python" . | cut -f1 -d :)
   do
      sed -i "s|usr/bin/python$|usr/bin/python2|g" $file
   done
   mkdir -p ${pkgdir}/usr/lib/systemd/system
   sed "s/_OPTION/ start/g" ${srcdir}/insync.service >${pkgdir}/usr/lib/systemd/system/insync@.service
   ln -sf "/usr/lib/libfontconfig.so.1" "${pkgdir}/usr/lib/insync/libfontconfig.so.1"
}
