# Inspired by wido's steelstorm (episode 1) pkgbuild
# Contributor: barraponto
# Maintainer: Jose Riha <jose1711 gmail com>
 
pkgname=steelstorm2-hib
_pkgname=steelstorm
pkgver=2.00.02818
epoch=4
pkgrel=10000
url="http://www.steel-storm.com/"
pkgdesc="a classic top down shooter, rife with explosions and things to explode, with a distinct visual style (version included in Humble Indie Bundle No 3)"
arch=('i686' 'x86_64')
license=('commercial')
install=${_pkgname}.install
depends=('curl' 'sdl_image' 'sdl_ttf' 'sdl_mixer' 'libvorbis' 'libogg' 'libmodplug' 'freetype2')
replaces=('steelstorm')
 
DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Manually download it to \"$(pwd)\", or set up a hib:// DLAGENT in /etc/makepkg.conf."; exit 1')
_gamepkg="steelstorm-br-${pkgver}-release.tar.gz"
 
source=("$_gamepkg::hib://$_gamepkg"
        steelstorm.desktop
        steelstorm.sh
        steelstorm-dedicated.desktop
        steelstorm-dedicated.sh)
conflicts=('steelstorm2' 'steelstorm' 'steelstorm-beta')
 
md5sums=('47a70084ec01f3fc5c20f8ff76a687fe'
         '21848d410d35f60f227cc8cf662251e4'
         '73d596ac67fb34ebc28df1f89b789dc2'
         '1ec8024f637b9608732c3d9b72dba226'
         '565ec1b72aff78bd2e311c289b65e2d5')
 
build() {
true
}
 
package() {
  cd ${srcdir}
 
  cd ${_pkgname}
  mkdir -p ${pkgdir}/opt/
  
  cp -r ${srcdir}/${_pkgname} ${pkgdir}/opt/
 
  if [ "${CARCH}" = "x86_64" ]; then
      # Delete bin 32 bits
      rm ${pkgdir}/opt/${_pkgname}/${_pkgname} ${pkgdir}/opt/${_pkgname}/${_pkgname}-dedicated
      install -Dm 755 ${pkgdir}/opt/${_pkgname}/${_pkgname}64 ${pkgdir}/opt/${_pkgname}/${_pkgname}
      install -Dm 755 ${pkgdir}/opt/${_pkgname}/${_pkgname}64-dedicated ${pkgdir}/opt/${_pkgname}/${_pkgname}-dedicated
 
  elif [ "${CARCH}" = "i686" ]; then
      # Delete bin 64 bits
      rm ${pkgdir}/opt/${_pkgname}/${_pkgname}64 ${pkgdir}/opt/${_pkgname}/${_pkgname}64-dedicated
      chmod 0755 ${pkgdir}/opt/${_pkgname}/${_pkgname}
      chmod 0755 ${pkgdir}/opt/${_pkgname}/${_pkgname}-dedicated
  
  else
 
      echo "If you're not running x86_64 or i686, how are you running Arch?"
      return 1
  fi
 
  # Install .desktop, icon, license and bin
  install -Dm 644 ${srcdir}/steelstorm.desktop ${pkgdir}/usr/share/applications/steelstorm.desktop
  install -Dm 755 ${srcdir}/steelstorm.sh $pkgdir/usr/bin/steelstorm
  install -Dm 644 ${srcdir}/steelstorm-dedicated.desktop ${pkgdir}/usr/share/applications/steelstorm-dedicated.desktop
  install -Dm 755 ${srcdir}/steelstorm-dedicated.sh $pkgdir/usr/bin/steelstorm-dedicated
 
  install -Dm 644 ${pkgdir}/opt/${_pkgname}/icons/ss_ep2_icon_64.png ${pkgdir}/usr/share/pixmaps/steelstorm.png
  install -Dm 644 ${pkgdir}/opt/${_pkgname}/license.txt ${pkgdir}/usr/share/licenses/license.txt
}
md5sums=('dc3e88ac4efd12e88037af140aa803ca'
         '21848d410d35f60f227cc8cf662251e4'
         '73d596ac67fb34ebc28df1f89b789dc2'
         '1ec8024f637b9608732c3d9b72dba226'
         '565ec1b72aff78bd2e311c289b65e2d5')
