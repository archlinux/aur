# Maintainer: bitwave
# Contributor: Joseph Xu <josephzxu@gmail.com>
# Contributor: Manuel Mendez <mmendez534@gmail.com>
pkgname=zgrviewer
pkgver=0.10.0
pkgrel=3
arch=(any)
pkgdesc="A 2.5D graph visualizer that displays graphs specified in the AT&T GraphViz DOT language"
url="http://zvtm.sourceforge.net/zgrviewer.html"
license=('LGPL')
depends=('java-environment' 'graphviz')
makedepends=('unzip')
source=(http://downloads.sourceforge.net/zvtm/${pkgname}-${pkgver}.zip zgrv defaultconfig zgrviewer.install)
install="${pkgname}.install"
md5sums=('d6d3a2276b44b0d8918a13ba267be1bb'
         '356e73f025d7fe72e816552d788128d6'
         '6a5d4e2c35e9b5ba858d64d51307d818'
         'd82e1cc8c5c2c7cd23f9c36a40b8d869')
noextract=("${pkgname}-${pkgver}.zip")

package()
{
  cd ${srcdir}
  
  # start script
  mkdir -p ${pkgdir}/usr/bin
  install -m755 zgrv ${pkgdir}/usr/bin
  
  # installing all jars to /opt/zgrviewer. If they belong somewhere else, let me know
  mkdir -p ${pkgdir}/opt/${pkgname}
  
  # default config
  install -m644 defaultconfig ${pkgdir}/opt/${pkgname}
  
  # jars
  unzip ${pkgname}-${pkgver}.zip
  cd ${pkgname}-${pkgver}
  mkdir ${pkgdir}/opt/${pkgname}/target
  mkdir ${pkgdir}/opt/${pkgname}/plugins
  install -m644 target/*.jar ${pkgdir}/opt/${pkgname}/target
  
  # licenses
  mkdir -p ${pkgdir}/usr/share/licenses/zgrviewer
  install -m644 antlr.license.txt ${pkgdir}/usr/share/licenses/zgrviewer
  install -m644 xerces.license.txt ${pkgdir}/usr/share/licenses/zgrviewer
  install -m644 zvtm.license.txt ${pkgdir}/usr/share/licenses/zgrviewer

}
