# Maintainer : Yamada Hayao <hayao@fascode.net>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: slact

pkgname=tlpui
tlpui_ver="1.3.1-8"
pkgver="$(echo "${tlpui_ver}" | tr "-" ".")"
pkgrel="3"
pkgdesc="A GTK user interface for TLP written in Python"
arch=('any')
url="https://github.com/d4nj1/TLPUI"
license=('GPL2')
depends=('tlp' 'python-gobject')
makedepends=('git' 'python-setuptools')
source=("tlpui-${tlpui_ver}.zip::https://github.com/d4nj1/TLPUI/archive/tlpui-${tlpui_ver}.zip"
        "${pkgname}.desktop")
sha256sums=('17b4cb3fcadcd6b8bb5e4588b60ecd8b48d079e17ad748c459f98fa63e62e20d'
            'fbf9e4b92bff5c92f5ced1ee1b155110b32cd128e5f066260d8dc6cea163c4af')

build() {
	cd "${srcdir}/TLPUI-tlpui-${tlpui_ver}"
	python setup.py build
}

package() {
	cd "${srcdir}/TLPUI-tlpui-${tlpui_ver}"
	export PYTHONHASHSEED=0
	python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build

	install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}
