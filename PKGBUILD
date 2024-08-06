# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="mtable"
pkgname="python-${_name}"
pkgver=0.1.22
_commit="97f59245683a1a20fc19595298485535bc1bc9ec"
pkgrel=1
pkgdesc="Format data to reStructedText and Markup Table"
arch=('any')
url="https://github.com/liuyug/${_name}"
license=('custom:BSD-?-Clause')
makedepends=('python-build' 'python-installer' 'python-wheel'
             'python-setuptools')
# testdepends=('python-chardet')
depends=('python' 'python-wcwidth' 'python-beautifulsoup4' 'python-pandas')
_pkgsrc="${_name}-${_commit}"
source=("${_pkgsrc}.tar.gz::${url}/archive/${_commit}.tar.gz")
sha256sums=('adbb73b6ee6808ac597c4061976b1bf94d448087aa5c1386b810fa68a978587f')

build () {
  cd "${srcdir}/${_pkgsrc}"
  python -m build --wheel --no-isolation
}

package () {
  cd "${srcdir}/${_pkgsrc}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm644 "README.rst" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  # install -Dm644 "LICENSE"    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
