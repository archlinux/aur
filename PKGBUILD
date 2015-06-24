# Maintainer: Ranger <rangergr@archlinux.gr>
# Contributor: Ferik <djferik at gmail dot com>

pkgname=xnretro
pkgver=1.26
pkgrel=3
pkgdesc="XnRetro allows you to create stunning images with vintage or instant effect on your Desktop."
url="http://www.xnview.com/"
arch=('i686' 'x86_64')
license=('freeware')

if [[ $CARCH == i686 ]]; then
  depends+=('qt4' 'qtwebkit' 'gstreamer0.10-base' 'libpng12')
  
else
  depends+=('lib32-qt4' 'qtwebkit' 'lib32-gstreamer0.10-base' 'lib32-libpng12')
  
fi

conflicts=('')
source=("http://download.xnview.com/XnRetro-linux.tgz" "XnRetro.desktop")
sha256sums=('e0912a4fd9d9e095f695bf6e89b81b3ed9894caca05d247fde9126b3102990cd' 'd25ccfca3ef1cb4f1474be5f2ec49666bda98e2220daa2d9ab7d22b801cd1c8b')


package() 
{
 mkdir -p "${pkgdir}/opt/XnRetro"
 cd "${srcdir}/XnRetro"
 
 /bin/tar cf - * | ( cd ${pkgdir}/opt/XnRetro; tar xfp - )
 rm ${srcdir}/XnRetro/XnRetro.desktop
 
 mv ../XnRetro.desktop ${srcdir}/XnRetro
 
 install -D -m644 ${srcdir}/XnRetro/xnretro.png ${pkgdir}/usr/share/pixmaps/xnretro.png
 install -D -m644 ${srcdir}/XnRetro/XnRetro.desktop ${pkgdir}/usr/share/applications/XnRetro.desktop

  rm ${pkgdir}/opt/XnRetro/XnRetro.desktop
  rm ${pkgdir}/opt/XnRetro/xnretro.png

}