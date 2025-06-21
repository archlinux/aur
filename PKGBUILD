# Maintainer: Aseem Athale <athaleaseem@gmail.com>

_name=varname
pkgname=python-varname
pkgver=0.15.0
pkgrel=1
pkgdesc="A Python library to retrieve variable names from functions or classes"
arch=('any')
url="https://github.com/pwwang/${pkgname}"
license=('MIT')
depends=('python' 'python-executing')
optdepends=('python-asttokens' 'python-pure-eval')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel' 'python-poetry')
source=("$pkgname-$pkgver.tar.gz"::${url}/archive/refs/tags/${pkgver}.tar.gz)
b2sums=('6da7a662723bfe8f6ec6b18fbce276c195a17524690103184726be2981ae225f09439a97e1b81cbbb8b7211206be464f84564d16c57fc3d7bf7ef0cc474db919')

build() {
  cd "${pkgname}-${pkgver}"
	## skip dependency check because of pinned deps
  python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
