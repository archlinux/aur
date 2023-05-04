# Maintainer: Ismo Toijala <ismo.toijala@gmail.com>
pkgname=(
	update-dotdee
	python-update-dotdee
)
pkgbase=update-dotdee
pkgver=6.0
pkgrel=3
pkgdesc="Generic modular configuration file manager"
arch=(any)
url="https://github.com/xolox/python-update-dotdee"
license=(MIT)
depends=(
	python
	python-coloredlogs
	python-executor
	python-humanfriendly
	python-naturalsort
	python-property-manager
	python-six
)
makedepends=(
	python-setuptools
)
source=(
	"https://files.pythonhosted.org/packages/source/${pkgbase::1}/${pkgbase}/${pkgbase}-${pkgver}.tar.gz"
)
sha256sums=('5897da85cc2115dc894aa27c986274b2930c4b56068cd44634fb543eafb88b41')

prepare() {
	cd "${pkgbase}-${pkgver}"
	# don't try to install missing dependencies, error instead
	cat >> setup.cfg <<EOF
[easy_install]
find_links = file:///dev/null
index_url = file:///dev/null
EOF
}

build() {
	cd "${srcdir}/${pkgbase}-${pkgver}"
	python setup.py build
}

package_update-dotdee() {
	depends=(
		python-setuptools
		python-update-dotdee
	)

	cd "${pkgbase}-${pkgver}"
	python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
	rm -rf "${pkgdir}/usr/lib"
	install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}

package_python-update-dotdee() {
	cd "${pkgbase}-${pkgver}"
	python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
	rm -rf "${pkgdir}/usr/bin"
	install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
