# Maintainer: Lorenzo Giuliani <lorenzo at giuliani dot me>

pkgname=postage-bin
pkgver=3.2.9
pkgrel=2
pkgdesc="Postage - A fast replacement for PGAdmin"
arch=('i686' 'x86_64')
url="https://www.workflowproducts.com/postage.html"
license=('custom:postage', 'custom:electron', 'custom:chromium')
depends=('alsa-lib' 'gconf' 'gtk2' 'libxss' 'libxtst' 'nss')
makedepends=('')
source=("LICENSE.postage.txt::https://raw.githubusercontent.com/workflowproducts/postage/master/LICENSE"
        "postage.sh")
source_i686=("${pkgname}-${pkgver}-i686.rpm::https://github.com/workflowproducts/postage/releases/download/eV3.2.9/Postage-3.2.9-ia32.rpm")
source_x86_64=("${pkgname}-${pkgver}-x86_64.rpm::https://github.com/workflowproducts/postage/releases/download/eV3.2.9/Postage-3.2.9.rpm")
sha256sums=('SKIP' 'SKIP')
sha256sums_i686=('20e62bc7e7eed0653cb662cf9726c73c054743b3c8a8a70fed52e93ceddaacf0')
sha256sums_x86_64=('ec5d2123d1d8459e20d20f1a797ecc7f3372d3a892db4f40ff6a15bacecb60f1')

package() {
	install -d "${pkgdir}"/opt/Postage
	install -d "${pkgdir}"/usr/bin
	install -d "${pkgdir}"/usr/share/applications
	install -d "${pkgdir}"/usr/share/share/icons
	install -d "${pkgdir}"/usr/share/licenses/postage

	cp --preserve=mode -r "${srcdir}"/opt/Postage/* "${pkgdir}"/opt/Postage
	cp --preserve=mode -r "${srcdir}"/usr/share/applications/* "${pkgdir}"/usr/share/applications
	cp --preserve=mode -r "${srcdir}"/usr/share/icons/* "${pkgdir}"/usr/share/icons

	install -Dm644 "${srcdir}"/opt/Postage/LICENSES.chromium.html "${pkgdir}"/usr/share/licenses/postage/LICENSES.chromium.html
	install -Dm644 "${srcdir}"/opt/Postage/LICENSE.electron.txt "${pkgdir}"/usr/share/licenses/postage/LICENSE.electron.txt
	install -Dm644 "${srcdir}"/LICENSE.postage.txt "${pkgdir}"/usr/share/licenses/postage/LICENSE.postage.txt
	install -m755 postage.sh "${pkgdir}"/usr/bin/postage
}
