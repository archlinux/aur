# Maintainer: ava1ar <mail@ava1ar.me>

pkgname=aftershotpro3
pkgver=3.2.0.205
pkgrel=2
pkgdesc="Professional Workflow and RAW Conversion (3rd version)"
url="http://www.aftershotpro.com/en/products/aftershot/pro"
arch=('x86_64')
license=('custom')
depends=('qt5-webkit' 'qt5-tools' 'qt5-svg' 'ocl-icd')
optdepends=('opencl-nvidia' 'opencl-mesa' 'opencl-catalyst')
source=(AfterShotPro_${pkgver}.rpm::http://dwnld.aftershotpro.com/trials/3/AfterShotPro3.rpm license.txt)
sha1sums=('b2c06e24a96624864fb63d528621ee0680558e9f'
          'f4b747625da3ad5d09536eb6e68107817826ec7b')

package() {
	# coping rpm content
	mv ${srcdir}/opt ${pkgdir}/
	install -d ${pkgdir}/usr/share
	mv ${srcdir}/usr/bin ${pkgdir}/usr/
	mv ${srcdir}/usr/share/{applications,pixmaps} ${pkgdir}/usr/share/
	install -d ${pkgdir}/usr/share/mime/packages/
	mv ${srcdir}/usr/share/mime/packages/* ${pkgdir}/usr/share/mime/packages/

	# deleting bundled libs
	rm -rf ${pkgdir}/opt/AfterShot3\(64-bit\)/lib
	# updating exec script
	sed -i 's|export LD_LIBRARY_PATH|export QT_PLUGIN_PATH=/usr/lib/qt/plugins\n#export LD_LIBRARY_PATH|' ${pkgdir}/usr/bin/AfterShot3X64
	
	# install license
	install -Dm644 license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}
