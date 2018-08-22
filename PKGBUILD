# Maintainer: Benjamin Schäfer <b-schaefer at posteo dot de>
# Contributor: Lorenzo Giuliani <lorenzo at giuliani dot me>

pkgname=pgmanage-bin
pkgver=10.3.1
pkgrel=1
pkgdesc="pgManage - A fast alternative to PGAdmin"
arch=('i686' 'x86_64')
url="https://www.workflowproducts.com/services.html#software"
license=('custom:postage', 'custom:electron', 'custom:chromium')
depends=('alsa-lib' 'gconf' 'gtk2' 'libxss' 'libxtst' 'nss')
makedepends=('')
name=pgManage
source=("LICENSE.${name}.txt::https://raw.githubusercontent.com/${name}/${name}/master/LICENSE"
        "${name}.sh")
source_i686=("${pkgname}-${pkgver}-i686.rpm::https://github.com/${name}/${name}/releases/download/v${pkgver}/${name}-${pkgver}-ia32.rpm")
source_x86_64=("${pkgname}-${pkgver}-x86_64.rpm::https://github.com/${name}/${name}/releases/download/v${pkgver}/${name}-${pkgver}.rpm")
sha256sums=('SKIP' 'SKIP')
md5sums_i686=('ae51e9e05c1838785ba5a805cb1a2452')
md5sums_x86_64=('b8ecbad69f4c78fa9ed5421335023e70')

package() {
	install -d "${pkgdir}"/opt/${name}
	install -d "${pkgdir}"/usr/bin
	install -d "${pkgdir}"/usr/share/applications
	install -d "${pkgdir}"/usr/share/icons

	cp --preserve=mode -r "${srcdir}"/opt/${name}/* "${pkgdir}"/opt/${name}
	cp --preserve=mode -r "${srcdir}"/usr/share/applications/* "${pkgdir}"/usr/share/applications
	cp --preserve=mode -r "${srcdir}"/usr/share/icons/* "${pkgdir}"/usr/share/icons

	install -Dm644 "${srcdir}"/opt/${name}/LICENSES.chromium.html "${pkgdir}"/usr/share/licenses/${name}/LICENSES.chromium.html
	install -Dm644 "${srcdir}"/opt/${name}/LICENSE.electron.txt "${pkgdir}"/usr/share/licenses/${name}/LICENSE.electron.txt
	install -Dm644 "${srcdir}"/LICENSE.${name}.txt "${pkgdir}"/usr/share/licenses/${name}/LICENSE.${name}.txt
	install -m755 ${name}.sh "${pkgdir}"/usr/bin/${name}
}

