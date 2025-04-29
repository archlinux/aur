# Maintainer: crimist <aur at crim dot ist>
# Contributor: Sophie Tauchert <sophie@999eagle.moe>

_pkgname=injector
pkgname=python-${_pkgname}
pkgver=0.22.0
pkgrel=1
pkgdesc="Python dependency injection framework, inspired by Guice."
arch=('any')
url="https://github.com/python-injector/injector"
license=('BSD')
depends=('python' 'python-typing_extensions')
makedepends=('python-setuptools')
provides=()
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/python-injector/injector/refs/heads/master/COPYING")
sha256sums=('79b2d4a0874c75d3aa735f11c5b32b89d9542711ca07071161882c5e9cc15ed6'
            '567278bc23fa55244f132af7164aa684940c75fa35b19c395899422cb92613ba')

build() {
	cd "${_pkgname}-$pkgver"
	python setup.py build
}

package() {
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	cd "${_pkgname}-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
