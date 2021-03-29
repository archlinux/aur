# Maintainer: Pavle Portic <archlinux@theedgeofrage.com>

pkgname='python-certifi-system-store'
_module=${pkgname/python-/}
_pypkgname='certifi_system_store'
pkgver='3021.3.16'
pkgrel=1

pkgdesc="A certifi hack to use system trust store on Linux/FreeBSD"
url="https://github.com/tiran/certifi-system-store"
license=('MPL')
arch=('any')

depends=('python')
makedepends=('python-setuptools' 'python-wheel')
provides=('python-certifi')
conflicts=('python-certifi')

source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('603be2b260ae2d5d025f584a219087683ff2ddcd09325ebb56b172cd07877057')

build() {
	cd "${srcdir}/${_module}-${pkgver}"
	python setup.py dist_info
	python setup.py bdist_wheel
}

package() {
	PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps "${srcdir}/${_module}-${pkgver}/dist/${_pypkgname}-${pkgver}-py3-none-any.whl"
}
