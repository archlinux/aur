# Contributor: twa022 <twa022@gmail.com>

pkgname=dockbarx-dock-theme
pkgver=1
pkgrel=3
pkgdesc="DockBarX Theme"
arch=('any')
url="http://bigrza.deviantart.com/art/Dock-theme-for-DockbarX-164283521"
license=('GPL')
depends=('dockbarx')
makedepends=('imagemagick')
groups=('dockbarx-themes')
source=('http://fc05.deviantart.net/fs70/f/2010/136/c/5/Dock_theme_for_DockbarX_by_BigRZA.zip')
#DLAGENTS=('http::/usr/bin/wget -c -t 3 --waitretry=3 -H -U Mozilla -O %o %u')
sha256sums=('ec6da776ca93fa5e470ee09788e988032a2c9131d770e861a4d5353d30837d89')

package () {
  install -D -m644 ${srcdir}/Dock.tar.gz ${pkgdir}/usr/share/dockbarx/themes/Dock.tar.gz
  install -D -m644 ${srcdir}/DockV.tar.gz ${pkgdir}/usr/share/dockbarx/themes/Dock-Vertical.tar.gz
  cd ${srcdir}
  
  mkdir -p ${srcdir}/Dock-Tight
  tar -zxf ${srcdir}/Dock.tar.gz -C ${srcdir}/Dock-Tight
  sed -i 's:aspect_ratio="3/2":aspect_ratio="1/1":' ${srcdir}/Dock-Tight/config
  sed -i 's:<theme name = "Dock">:<theme name = "Dock-Tight">:' ${srcdir}/Dock-Tight/config
  for _png in $( find ${srcdir}/Dock-Tight/pixmaps -name *png ) ; do 
    if [[ "$( basename ${_png} )" == 'launcherbutton.png' ]] ; then
	  convert -shave 11x0 ${_png} ${_png}
	else
      convert -shave 10x0 ${_png} ${_png}
	fi
  done
  cd ${srcdir}/Dock-Tight/ 
  tar -czf Dock-Tight.tar.gz *
  install -D -m644 ${srcdir}/Dock-Tight/Dock-Tight.tar.gz ${pkgdir}/usr/share/dockbarx/themes/Dock-Tight.tar.gz


  mkdir -p ${srcdir}/DockV-Tight
  tar -zxf ${srcdir}/DockV.tar.gz -C ${srcdir}/DockV-Tight
  sed -i 's:aspect_ratio="4/3":aspect_ratio="1/1":' ${srcdir}/DockV-Tight/config
  sed -i 's:<theme name = "DockV">:<theme name = "DockV-Tight">:' ${srcdir}/DockV-Tight/config
  for _png in $( find ${srcdir}/DockV-Tight/pixmaps -name *png ) ; do 
    if [[ "$( basename ${_png} )" == 'launcherbutton.png' ]] ; then
	  convert -shave 0x11 ${_png} ${_png}
	else
      convert -shave 0x10 ${_png} ${_png}
	fi
  done
  cd ${srcdir}/DockV-Tight/ 
  tar -czf DockV-Tight.tar.gz *
  install -D -m644 ${srcdir}/DockV-Tight/DockV-Tight.tar.gz ${pkgdir}/usr/share/dockbarx/themes/DockV-Tight.tar.gz
}

