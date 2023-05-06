# Maintainer: Anakojm <https://anakojm.net/a-propos/#contact>

pkgname='python-krfzf'
_pkgname='krfzf-py'
pkgver=0.0.4
pkgrel=2
pkgdesc="A Pythonic Fzf Wrapper"
arch=('any')
url="https://pypi.org/project/$_pkgname/"
license=('GPL3')
depends=('python>=3.9.0' 'python<4.0.0')
makedepends=('python-build')
source=("https://files.pythonhosted.org/packages/78/93/c8eda31c6177f993cb111c9f8d7eec26cc949049c163f7561f13d5ecf316/${_pkgname/-/_}-$pkgver.tar.gz")
sha256sums=('5b4c29475fc746bb580b7bea13087e270920c277dae3d2c214802b3976923c21')

build(){
	python -m build --no-isolation --wheel "$srcdir/${_pkgname/-/_}-$pkgver"
}

package() {
  _py=$(python --version)
  _py=${_py%%.*}

  python -m installer --destdir="$pkgdir" \
    "$srcdir/${_pkgname/-/_}-$pkgver/dist/${_pkgname/-/_}-${pkgver%.r*}-py${_py##* }-none-any.whl"
}
