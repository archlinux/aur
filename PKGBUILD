# Maintainer: Kain Huang <iblader@gmail.com>
pkgname=netbeans-bin
pkgver=30
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
depends=('ttf-font' 'which' 'java-environment>=21')
optdepends=('php: for developing programs in php'
            'groovy: for developing programs in groovy')
#sha512sums from ("https://downloads.apache.org/netbeans/netbeans/${pkgver}/netbeans-${pkgver}-bin.zip.sha512")
sha512sums=('18df3504f8e75e563669b2442e2a3940136e3f7f4892d319c5e11ef03b76a1d52b46b104ff1c6b54f5b46b3c99199b1b75fe09cf1b2dd6ba8b491137a4bba7f7'
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
