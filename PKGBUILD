# Maintainer: a821 <a821 mail.de>
# Contributor: lukaszimmermann <luk.zim91 gmail.com>
# Contributor: florianbw <florian.bw gmail.com>

pkgname=cytoscape
pkgver=3.10.4
pkgrel=1
pkgdesc="Network Data Integration, Analysis, and Visualization in a Box"
arch=('any')
url=https://www.cytoscape.org
license=('LGPL-2.1-only')
depends=('jdk17-openjdk' 'bash')
optdepends=('opencl-driver: for OpenCL support')
source=("https://github.com/cytoscape/cytoscape/releases/download/${pkgver}/cytoscape-unix-${pkgver}.tar.gz"
        "${pkgname}.desktop"
        "${pkgname}.png"
        "${pkgname}"
        "0001-fix-cytoscape.vmoptions-file-location.patch"
        "0002-fix-karaf-instances-dir.patch"
)

sha256sums=('807094f7b01f073a38afe17e15ce651ddfa442d8ff36ca02362a4086fe4eeec1'
            'f4476545086f845e1cec5861169270da9f82a6ad4944972010827a567af0c7d0'
            '135faa3f0beb8ecc1b704cf376408e8bd5f62f32ba50a84002c14321d0bb0b68'
            'daf81142f560db93aeeea96ca185a2662dd0ec9ee220aee167bf826fc44f3dc3'
            'fadbacc92c147dead6f09577aedda08aca3a70c04386d91cbee2562739c5645b'
            '4a65e776ab9092e5828b3c9299add0452b131e1665343bd10758399f67479f47')

prepare() {
  cd ${pkgname}-unix-${pkgver}
  patch -p1 -i ../0001-fix-cytoscape.vmoptions-file-location.patch
  patch -p1 -i ../0002-fix-karaf-instances-dir.patch
}

package() {
  install -d -m755 "${pkgdir}/opt"
  cp -r cytoscape-unix-${pkgver} "${pkgdir}/opt/cytoscape"
  install -Dm755 -t "${pkgdir}/usr/bin" "${pkgname}"
  install -Dm644 -t "${pkgdir}/usr/share/pixmaps" "${pkgname}.png"
  install -Dm644 -t "${pkgdir}/usr/share/applications" "${pkgname}.desktop"
}

# vim:set ts=2 sw=2 et:
