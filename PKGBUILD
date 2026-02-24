# Maintainer: Kain Huang <iblader@gmail.com>
pkgname=netbeans-bin
pkgver=29
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
sha512sums=('62d953d4b7a9ecdfe4db8b51120ad371f9046936af4b24d2ac880b680a5b11cd9475cf899f13d3027986451497cd7f9b5d89620c438d02da7809c38b5332ae83'
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
