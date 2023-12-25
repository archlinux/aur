# Maintainer: Kain Huang <iblader@gmail.com>
pkgname=netbeans-bin
pkgver=20
pkgrel=2
pkgdesc='IDE for Java, HTML5, PHP, Groovy, C and C++'
arch=('any')
url='https://netbeans.apache.org/'
license=('Apache')
source=('https://downloads.apache.org/netbeans/netbeans/20/netbeans-20-bin.zip')
makedepends=('gendesk')
depends=('ttf-font' 'which' 'java-environment>=11')
optdepends=('php: for developing programs in php'
            'groovy: for developing programs in groovy'
            'lib32-glibc')
#sha512sums from ('https://downloads.apache.org/netbeans/netbeans/20/netbeans-20-bin.zip.sha512')
sha512sums=('59eb2b0e7887f0d962d180c4004a81cf752f12a2b9456c59417daf90a312877f697500580c53566a220bde2a49df2b95ba1e4dedb4cf59b49bdacdc47c98745f')

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
