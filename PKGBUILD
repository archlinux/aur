# Maintainer: Tony Lambiris <tony@libpcap.net>

pkgbase=python-smartcols
pkgname=('python2-smartcols' 'python-smartcols')
pkgver=0.3.0
pkgrel=2
pkgdesc="Python bindings for util-linux libsmartcols-library."
arch=("any")
license=("GPL")
url="https://github.com/ignatenkobrain/python-smartcols"
depends=("python" "python2")
source=("https://github.com/ignatenkobrain/${pkgbase}/archive/v${pkgver}.tar.gz")
sha256sums=('88dfe9ee99089b1b84b3476362e6f0be2f89d4420a6cbe7436fbd661f07f29d1')

prepare() {
	cp -a "${pkgbase}-${pkgver}" "${pkgbase}-${pkgver}-py2"
	# change python to python2
	cd "${pkgbase}-${pkgver}-py2"
	find . -name '*.py' -exec sed -i "s|python|python2|g" {} \;
}

build() {
	cd "${srcdir}/${pkgbase}-${pkgver}"
	python ./setup.py build

	cd "${srcdir}/${pkgbase}-${pkgver}-py2"
	python2 ./setup.py build
}

package_python-smartcols() {
	depends=("python")

	cd "${srcdir}/${pkgbase}-${pkgver}"
	python ./setup.py install --root="${pkgdir}" --optimize=1
	install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python2-smartcols() {
	depends=("python2")

	cd "${srcdir}/${pkgbase}-${pkgver}-py2"
	python2 ./setup.py install --root="${pkgdir}" --optimize=1
	install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
