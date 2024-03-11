# Maintainer: Jeff Barfield (noprobelm[at]protonmail[dot]org)

pkgname=python-terminaltables
_pyname=terminaltables
pkgver=3.1.10
pkgrel=11
pkgdesc="Generate simple tables in terminals from a nested list of strings"
arch=('any')
url="https://github.com/matthewdeanmartin/terminaltables"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-wheel' 'python-installer' 'python-poetry-core')
checkdepends=('python-pytest' 'python-colorama' 'python-termcolor' 'python-colorclass')
source=("${_pyname}-${pkgver}.tar.gz::https://github.com/matthewdeanmartin/${_pyname}/archive/v${pkgver}.tar.gz"
        python-3.8.patch
        poetry-core.patch)
sha512sums=('84fa403cee4206b6b19de0206d89535bd2965a0796e1890dd9b0a9c6593c5f41d0d24b88ee9db426067c777712a4e810d67d4d0246496239a7a96b53a24e8174'
            '9a33ef51cbd2854bf9acc247e2d966332229446158e7dae9cad25e03335eb9689d50b0a22234285aa56c707e6e93c12f950299efcfbe7e42ed527216090592f2'
	   '4497c99e4bf54709944aff2296460728259750b6b81db549d0b06f31cd853106124c264e51f30a4b3da4e74ea662baa6f39ec48f1d58b59701fbe3e43469a543')

prepare() {
  cd ${_pyname}-${pkgver}
  patch -Np1 < ../python-3.8.patch
  patch -Np1 < ../poetry-core.patch

}

build() {
  cd ${_pyname}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd ${_pyname}-${pkgver}
  python -m installer --destdir="$pkgdir" --compile-bytecode=2 dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 example*.py -t "${pkgdir}/usr/share/doc/${pkgname}/examples"
}
