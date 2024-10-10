# Maintainer: Aseem Athale <athaleaseem@gmail.com>

_name=varname
pkgname=python-varname
pkgver=0.13.4
pkgrel=1
pkgdesc="A Python library to retrieve variable names from functions or classes"
arch=('any')
url="https://github.com/pwwang/${pkgname}"
license=('MIT')
depends=('python' 'python-executing')
optdepends=('python-asttokens' 'python-pure-eval')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel' 'python-poetry')
source=("$pkgname-$pkgver.tar.gz"::${url}/archive/refs/tags/${pkgver}.tar.gz)
sha512sums=('3a39546474a1f5dc0331b25b586f3d1e803895e0fc795a4bea640b899b94dc8c3e149a92bdb8af1a70c0ce3cdac6bba4459cf60e00afdbf753913f4e5fd35c76')

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
