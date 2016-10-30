# Maintainer: Nate Levesque <public@thenaterhood.com>
# Contributor: Vlad M. <vlad@archlinux.net>
# Contributor: Zhengyu Xu <xzy3186@gmail.com>

pkgname=insync
pkgver=1.3.12
_pkgver=36116
pkgrel=2
pkgdesc="An unofficial Google Drive client that runs on Linux, with support for various desktops"
url="https://www.insynchq.com/downloads"
license=('custom:insync')
options=(!strip !upx)
depends=('xdg-utils' 'glibc' 'python2')
arch=('i686' 'x86_64')
source=('insync@.service' 'insync.service')
source_i686=("http://s.insynchq.com/builds/${pkgname}_${pkgver}.${_pkgver}-trusty_i386.deb")
source_x86_64=("http://s.insynchq.com/builds/${pkgname}_${pkgver}.${_pkgver}-trusty_amd64.deb")
sha256sums=('67ffe1bc921dd18e2d0b12109da41b03430a29536f07ca6d464075145bd3f8c8'
            '7050fe46c1ddf2251a2826894c5a1d536ad56861d473abc1e66a5580fb9b0899')
sha256sums_i686=('b0c27926de2fea42c07c92285cd96c2936e449cab37c38a354a81a94b5d9298e')
sha256sums_x86_64=('750f1bfa381e1019b7320af24b43d800c95a737968ee15d4d174dd9f4ac6f5a2')

package() {
   tar xvf data.tar.gz
   cp -rp usr $pkgdir

   cd $pkgdir
   for file in $(grep -R "/usr/bin/python" . | cut -f1 -d :)
   do
      sed -i "s|usr/bin/python$|usr/bin/python2|g" $file
   done
   mkdir -p ${pkgdir}/usr/lib/systemd/system
   mkdir -p ${pkgdir}/usr/lib/systemd/user
   cp ${srcdir}/insync@.service ${pkgdir}/usr/lib/systemd/system/insync@.service
   cp ${srcdir}/insync.service ${pkgdir}/usr/lib/systemd/user/insync.service
   ln -sf "/usr/lib/libfontconfig.so.1" "${pkgdir}/usr/lib/insync/libfontconfig.so.1"
}
