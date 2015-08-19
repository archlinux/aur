# Maintainer: Vlad M. <vlad@archlinux.net>
# COntributor: Zhengyu Xu <xzy3186@gmail.com>

pkgname=insync
pkgver=1.2.18
_pkgver=35198
pkgrel=1
pkgdesc="An unofficial Google Drive client that runs on Linux, with support for various desktops"
url="https://www.insynchq.com/downloads"
license=('custom:insync')
options=(!strip !upx)
depends=('xdg-utils' 'glibc' 'python2')
optdepends=('insync-nautilus: file-manager integration for nautilus'
            'sni-qt: To show the icon in Plasma 5 tray')
arch=('i686' 'x86_64')
source=('insync.service')
sha256sums=('995d9131bd454015ff11414d002b8927b7397835969e27061008264c0c5f225d')
sha256sums_i686=('87a2390400fa40ce00717087805e096d0ea16f774e4bac1cec40fb46192eae65')
sha256sums_x86_64=('423170713180bb65fb3c2a7143514c9fabd3893c7a4e2c4b5dd3325e62a093d5')
source_i686=("http://s.insynchq.com/builds/${pkgname}_${pkgver}.${_pkgver}-trusty_i386.deb")
source_x86_64=("http://s.insynchq.com/builds/${pkgname}_${pkgver}.${_pkgver}-trusty_amd64.deb")

package() {
   cd $srcdir
   tar xvf data.tar.gz
   cp -rp usr $pkgdir

   cd $pkgdir
   for file in $(grep -R "/usr/bin/python" . | cut -f1 -d :)
   do
      sed -i "s|usr/bin/python$|usr/bin/python2|g" $file
   done
   mkdir -p ${pkgdir}/usr/lib/systemd/system
   sed "s/_OPTION/ start/g" ${srcdir}/insync.service >${pkgdir}/usr/lib/systemd/system/insync@.service
}
