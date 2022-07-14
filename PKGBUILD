# Maintainer: Sophie Tauchert <sophie@999eagle.moe>

_pkgname=injector
pkgname=python-${_pkgname}
pkgver=0.20.1
# temp fix while pypi version has no corresponding git tag
_git_tag=0.20.0
pkgrel=2
pkgdesc="Python dependency injection framework, inspired by Guice."
arch=('any')
url="http://github.com/alecthomas/injector"
license=('BSD')
depends=('python' 'python-typing_extensions')
makedepends=('python-setuptools')
provides=()
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/alecthomas/injector/${_git_tag}/COPYING")
sha256sums=('8661b49a2f8309ce61e3a6a82b7acb5e225c4bde8e17d1610c893a670dff223a'
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
