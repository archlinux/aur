# Maintainer: eomarjee <eyaz.omarjee+arch@gmail.com>
# Contributor: florianbw <florian.bw@gmail.com>

pkgname=cytoscape
pkgver=3.2.1
pkgrel=1
pkgdesc='A software for visualizing molecular interaction networks and integration with gene expression profiles and other state data.'
arch=('any')
url=http://www.cytoscape.org
license=('LGPL2')
depends=('java-runtime-common')
source=("http://chianti.ucsd.edu/cytoscape-$pkgver/cytoscape-$pkgver.tar.gz" \
        'cytoscape.desktop' \
        'cytoscape.png' \
        'cytoscape')
md5sums=('803a8e222291106386877539f9c53e54'
         '0a960d9cfb84b986136c2645f4ee4eab'
         'cbf3c0c062055861c8e2d82105afcc33'
         '64521a6620ba82895411c450d4ab639c')

build() {
  cd ${srcdir}/cytoscape-unix-${pkgver}
  ./gen_vmoptions.sh
}

package() {
  install -d ${pkgdir}/opt/cytoscape
  install -d ${pkgdir}/opt/cytoscape/framework/instances
  install -d ${pkgdir}/usr/share/{applications,pixmaps}
  install -d ${pkgdir}/usr/bin

  cd ${startdir}/
  cp -r ${srcdir}/cytoscape-unix-${pkgver}/* ${pkgdir}/opt/cytoscape
  chmod 755 ${pkgdir}/opt/cytoscape/cytoscape.sh 
  install -D -m755 cytoscape ${pkgdir}/usr/bin/
  install -D -m644 cytoscape.png ${pkgdir}/usr/share/pixmaps
  install -D -m644 cytoscape.desktop ${pkgdir}/usr/share/applications
}

# vim:set ts=2 sw=2 et:
