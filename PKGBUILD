# Maintainer: Kain Huang <iblader@gmail.com>
pkgname=netbeans-bin
pkgver=22
pkgrel=2
pkgdesc='IDE for Java, HTML5, PHP, Groovy, C and C++'
arch=('any')
url='https://netbeans.apache.org/'
license=('Apache')
source=('https://downloads.apache.org/netbeans/netbeans/22/netbeans-22-bin.zip')
makedepends=('gendesk')
depends=('ttf-font' 'which' 'java-environment>=11')
optdepends=('php: for developing programs in php'
            'groovy: for developing programs in groovy'
            'lib32-glibc')
#sha512sums from ('https://downloads.apache.org/netbeans/netbeans/${pkgver}/netbeans-${pkgver}-bin.zip.sha512')
sha512sums=('1d8ad549f9a2bfd8ee829691de1f7a22d35d0c2782676e2bc64eec32751e0edbda8a0240eec1ffd0a7e033f9fb2619b9e3ca1ddad40609f1d722a4deea16c0b6')

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
