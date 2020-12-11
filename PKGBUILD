# Maintainer : Yamada Hayao <hayao@fascode.net>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: slact

pkgname=tlpui
pkgver=1.3.1
pkgrel=1
pkgdesc="A GTK user interface for TLP written in Python"
arch=('any')
url="https://github.com/d4nj1/TLPUI"
license=('GPL2')
depends=('tlp' 'python-gobject')
makedepends=('git' 'python-setuptools')
provides=("${pkgname}-git")
conflicts=("${pkgname}-git")
source=("tlpui-${pkgver}.zip::https://github.com/d4nj1/TLPUI/archive/tlpui-${pkgver}.zip"
        "${pkgname}.desktop")
sha256sums=('30ec5563a1228805a02f412e004302cf73ba2e45e7374bfedfaa9d7074fd6ea8'
            'a8f7a4a3d1c66c27383f75b092fa71c3e7cd72b8240a06ed00ad56be3b5338ea')

build() {
	cd "${srcdir}/TLPUI-tlpui-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/TLPUI-tlpui-${pkgver}"
	export PYTHONHASHSEED=0
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build

	install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}
