# Maintainer: Ismo Toijala <ismo.toijala@gmail.com>
pkgname=(
	rotate-backups
	python-rotate-backups
)
pkgbase=rotate-backups
pkgver=8.1
pkgrel=3
pkgdesc="Simple command line interface for backup rotation"
arch=(any)
url="https://github.com/xolox/python-rotate-backups"
license=(MIT)
depends=(
	python
	python-coloredlogs
	python-dateutil
	python-executor
	python-humanfriendly
	python-naturalsort
	python-property-manager
	python-simpleeval
	python-six
	python-update-dotdee
	python-verboselogs
)
makedepends=(
	python-setuptools
)
source=(
	"https://files.pythonhosted.org/packages/source/${pkgbase::1}/${pkgbase}/${pkgbase}-${pkgver}.tar.gz"
)
sha256sums=('f8fe4012cb0b6768ffebe12d995bfd558fafaf636275ff016dd9135344b33980')

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

package_rotate-backups() {
	depends=(
		python-rotate-backups
		python-setuptools
	)

	cd "${pkgbase}-${pkgver}"
	python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
	rm -rf "${pkgdir}/usr/lib"
	install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}

package_python-rotate-backups() {
	cd "${pkgbase}-${pkgver}"
	python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
	rm -rf "${pkgdir}/usr/bin"
	install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
