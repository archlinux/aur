# Maintainer: lukaszimmermann <luk.zim91@gmail.com>
# Contributor: eomarjee <eyaz.omarjee+arch@gmail.com>
# Contributor: florianbw <florian.bw@gmail.com>

pkgname=cytoscape
pkgver=3.7.1
pkgrel=1
pkgdesc='A software for visualizing molecular interaction networks and integration with gene expression profiles and other state data.'
arch=('any')
url=http://www.cytoscape.org
license=('LGPL2')
depends=('java-runtime-headless>=8'
         'java-environment>=8')
source=("https://github.com/${pkgname}/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz" \
        "${pkgname}.desktop" \
        "${pkgname}.png" \
        "${pkgname}")

sha256sums=('1311386b19b565e5a2cf627318b5a2641492de07051dc9c1a1bcbdc5d7b31ad6'
            'f4476545086f845e1cec5861169270da9f82a6ad4944972010827a567af0c7d0'
            '135faa3f0beb8ecc1b704cf376408e8bd5f62f32ba50a84002c14321d0bb0b68'
            '5d44223825013e05e80580c4650c0bb8b72d1455fa93099759d1aa756d4a5df2')

build() {
  cd ${srcdir}/${pkgname}-unix-${pkgver}
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
