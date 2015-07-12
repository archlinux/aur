# Maintainer: Vlad M. <vlad@archlinux.net>
# COntributor: Zhengyu Xu <xzy3186@gmail.com>

pkgname=insync
pkgver=1.2.16
_pkgver=35181
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
sha256sums_i686=('a98c318d2446aa8bd1939472386041d287559fd8dd79a3312c54dc591114a770')
sha256sums_x86_64=('339eb3611e074599da83ddc39bfbc80c955a04988037a0f5c9e50e6728b57db3')

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
