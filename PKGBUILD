# Maintainer: Ismo Toijala <ismo.toijala@gmail.com>
pkgname=(
	update-dotdee
	python-update-dotdee
)
pkgbase=update-dotdee
pkgver=5.0
pkgrel=2
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
sha256sums=(
	7316afa9f63fb52cfcae17d10747a975df086fb82400bb310f1fe9f6a141e433
)

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
