# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Alexey Andreyev aa13q at ya.ru

pkgname='python-pymantic'
_module="${pkgname#python-}"
pkgver=0.2.5
pkgrel=2
pkgdesc='Semantic Web and RDF library for Python'
arch=('any')
url="https://pypi.org/project/${_module}/${pkgver}"
license=('BSD')
depends=(
  'python'
  'python-requests'
  'python-lxml'
  'python-pytz'
  'python-rdflib'
  'python-lark-parser'
  'python-pyld'
)
makedepends=('python-setuptools')
_sourcename="${_module}-${pkgver}"
source=("https://files.pythonhosted.org/packages/source/${_module::1}/${_module}/${_sourcename}.tar.gz"
        "${_sourcename}-LICENSE::https://github.com/norcalrdf/${_module}/raw/${pkgver}/LICENSE")
sha256sums=('119361a60d811aea6f57faf05f9aebc787e37244e3c8e9c922e9621b2a425dcf'
            'c5a804cb694b36e4604f1edaf496ad7aaa93690d27666a6a7887354ec3a1a884')

build() {
  cd "${_sourcename}"
  python setup.py build --executable='/usr/bin/env python'
}

package() {
  cd "${_sourcename}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install --verbose -Dm 644 "../${_sourcename}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
