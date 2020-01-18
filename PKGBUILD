# Maintainer: Sophie Tauchert <sophie@999eagle.moe>

_pkgname=injector
pkgname=python-${_pkgname}
pkgver=0.18.2
pkgrel=1
pkgdesc="Python dependency injection framework, inspired by Guice."
arch=('any')
url="http://github.com/alecthomas/injector"
license=('BSD')
depends=('python' 'python-typing_extensions')
makedepends=('python-setuptools')
provides=()
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/alecthomas/injector/${pkgver}/COPYING")
sha256sums=('fd5fdc33dfd72956f88bf9451ab975fd55779c2e2ee49b6c75430ec6235ff114'
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
