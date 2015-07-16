# Maintainer: Vlad M. <vlad@archlinux.net>
# COntributor: Zhengyu Xu <xzy3186@gmail.com>

pkgname=insync
pkgver=1.2.17
_pkgver=35187
pkgrel=1
pkgdesc="An unofficial Google Drive client that runs on Linux, with support for various desktops"
url="https://www.insynchq.com/downloads"
license=('custom:insync')
options=(!strip !upx)
depends=('xdg-utils' 'glibc' 'python2')
optdepends=('insync-nautilus: file-manager integration for nautilus'
            'insync-nemo: file-manager integration for nemo'
            'insync-dolphin: file-manager integration for dolphin'
            'insync-thunar: file-manager integration for thunar'
            'insync-caja: file-manager integration for caja'
            'sni-qt: To show the icon in Plasma 5 tray')
arch=('i686' 'x86_64')
source=('insync.service')
source_i686=("http://s.insynchq.com/builds/${pkgname}_${pkgver}.${_pkgver}-trusty_i386.deb")
source_x86_64=("http://s.insynchq.com/builds/${pkgname}_${pkgver}.${_pkgver}-trusty_amd64.deb")
sha256sums=('995d9131bd454015ff11414d002b8927b7397835969e27061008264c0c5f225d')
sha256sums_i686=('70830ff3225f429836b3df1b2a10d381580e83c003b6a1e97a61c1c033211cdd')
sha256sums_x86_64=('aaa91d96cadd84f221d8ee51996e4e804e5923425d5f220dffab12933f1354ff')

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
