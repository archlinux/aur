# Maintainer: Vlad M. <vlad@archlinux.net>
# Contributor: Zhengyu Xu <xzy3186@gmail.com>

pkgname=insync
pkgver=1.3.8
_pkgver=36087
pkgrel=1
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
sha256sums_i686=('c3d98ba3b2e254aee99484298db6e51106ab92ed0e2663ed2fa79cf8433d52cf')
sha256sums_x86_64=('bfdfde0828a3752672ba257aa3bcedcc36f5a2c8f7800d925f9d86986c4a78a7')

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
}
