# Maintainer: Kain Huang <iblader@gmail.com>
pkgname=netbeans-bin
pkgver=21
pkgrel=1
pkgdesc='IDE for Java, HTML5, PHP, Groovy, C and C++'
arch=('any')
url='https://netbeans.apache.org/'
license=('Apache')
source=('https://downloads.apache.org/netbeans/netbeans/21/netbeans-21-bin.zip')
makedepends=('gendesk')
depends=('ttf-font' 'which' 'java-environment>=11')
optdepends=('php: for developing programs in php'
            'groovy: for developing programs in groovy'
            'lib32-glibc')
#sha512sums from ('https://downloads.apache.org/netbeans/netbeans/21/netbeans-21-bin.zip.sha512')
sha512sums=('1bd5695755eb9547d88a5539a6e43884d787dba4da6ecadc1b261e07c1dda56d0a03986a66755c5d3a358216711c0393ac8fdd649e15c953bdfe380cb564ca65')

build(){
	gendesk -f -n \
		--name "Netbeans ${pkgver}"\
		--pkgname "netbeans-${pkgver}" \
		--pkgdesc "$pkgdesc" \
		--custom "StartupWMClass=NetBeans IDE Dev" \
		--exec="/opt/netbeans-${pkgver}/bin/netbeans" \
		--icon="/opt/netbeans-${pkgver}/netbeans-logo.svg"
}

package() {
  mkdir -p  "${pkgdir}/opt/netbeans-${pkgver}" "${pkgdir}/usr/share/applications/"
  cp -r netbeans/* "${pkgdir}/opt/netbeans-${pkgver}"
  cp ../netbeans-logo.svg "${pkgdir}/opt/netbeans-${pkgver}/"
  cp "netbeans-${pkgver}.desktop" "${pkgdir}/usr/share/applications/"
}
