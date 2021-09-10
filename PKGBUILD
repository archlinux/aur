# Maintainer: Sematre <sematre at gmx dot de>
pkgname=python-reusables
pkgver=0.9.6
pkgrel=2

pkgdesc="Commonly Consumed Code Commodities"
arch=('any')
url="https://github.com/cdgriffith/Reusables"
license=('MIT')
depends=(
	'python'
	'python-rarfile'
	'python-scandir'
)
makedepends=('python-setuptools' 'python-pip')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('df04af4916a3bc829de0f9bace276babbe66da3caa5a4fcbe2cb01c36cccbc00')

prepare() {
	cd "Reusables-${pkgver}"
	sed -i 's/description-file/description_file/' setup.cfg
}

build() {
	cd "Reusables-${pkgver}"
	python setup.py build
}

package() {
	cd "Reusables-${pkgver}"
	python setup.py install --prefix=/usr --root="${pkgdir}" --optimize 1 --skip-build
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
