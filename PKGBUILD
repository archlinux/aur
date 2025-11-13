# Maintainer: Kain Huang <iblader@gmail.com>
pkgname=netbeans-bin
pkgver=28
pkgrel=1
pkgdesc='IDE for Java, HTML5, PHP, Groovy, C and C++'
arch=('any')
url='https://netbeans.apache.org/'
license=('Apache')
# https://downloads.apache.org/netbeans/netbeans/${pkgver}/netbeans-${pkgver}-bin.zip
# https://www.apache.org/dyn/closer.lua/netbeans/netbeans/${pkgver}/netbeans-${pkgver}-bin.zip?action=download
source=("https://www.apache.org/dyn/closer.lua/netbeans/netbeans/${pkgver}/netbeans-${pkgver}-bin.zip?action=download"
	netbeans-logo.svg)
makedepends=('gendesk')
depends=('ttf-font' 'which' 'java-environment>=17')
optdepends=('php: for developing programs in php'
            'groovy: for developing programs in groovy')
#sha512sums from ("https://downloads.apache.org/netbeans/netbeans/${pkgver}/netbeans-${pkgver}-bin.zip.sha512")
sha512sums=('d0dd5c6f2dc795b9b4b5f469cde87b9665054369dcdf2fcc687cedfb358386de744fdae207404b2565ffb2136077ca2a988a1b52f69738a7d3b28400a8f4a3b0'
'e963494757f34512523bababdf72e7b7eb32d5f1034d5c1589d7a3aedb707de96a6e2e38dadd05c002cac76860957df1a98d3bda80913eaf26bb52502a0e5e13')

build(){
	gendesk -f -n \
		--name "Netbeans ${pkgver}"\
		--pkgname "netbeans-${pkgver}" \
		--pkgdesc "${pkgdesc}" \
		--custom "StartupWMClass=Apache NetBeans IDE ${pkgver}" \
		--exec="/opt/netbeans-${pkgver}/bin/netbeans" \
		--icon="/opt/netbeans-${pkgver}/netbeans-logo.svg"
}

package() {
  mkdir -p  "${pkgdir}/opt/netbeans-${pkgver}" "${pkgdir}/usr/share/applications/"
  install "netbeans-${pkgver}.desktop" "${pkgdir}/usr/share/applications/"
  cd ${srcdir}
  cp -r netbeans/* "${pkgdir}/opt/netbeans-${pkgver}"
  install netbeans-logo.svg "${pkgdir}/opt/netbeans-${pkgver}/"
}
