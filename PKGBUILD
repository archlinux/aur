# Maintainer: Kain Huang <iblader@gmail.com>
pkgname=netbeans-bin
pkgver=26
pkgrel=1
pkgdesc='IDE for Java, HTML5, PHP, Groovy, C and C++'
arch=('any')
url='https://netbeans.apache.org/'
license=('Apache')
source=("https://downloads.apache.org/netbeans/netbeans/${pkgver}/netbeans-${pkgver}-bin.zip"
					netbeans-logo.svg)
makedepends=('gendesk')
depends=('ttf-font' 'which' 'java-environment>=17')
optdepends=('php: for developing programs in php'
            'groovy: for developing programs in groovy')
#sha512sums from ("https://downloads.apache.org/netbeans/netbeans/${pkgver}/netbeans-${pkgver}-bin.zip.sha512")
sha512sums=('40c85c6a6166335f5bd5041f7eddd05a19ab6dfb357bb704e3122206319ef3b473cbb84e2cf448f1b43031f9622f95ae77216befd27599b0d1e8f81292f7341b'
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
