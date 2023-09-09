# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: brent s. <bts[at]square-r00t[dot]net>

_pkgname=pyhcl
pkgname=python-pyhcl
# curl https://api.github.com/repos/virtuald/pyhcl/git/ref/tags/$pkgver | jq -r .object.sh
_commit=5dcf8b8a5e826e24cd6e572c4215283bf4b06d45
pkgver=0.4.5
pkgrel=1
pkgdesc='HCL configuration parser for python'
arch=(any)
url='https://pypi.org/project/pyhcl/'
license=(MPL2)
depends=(python)
makedepends=(git python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
# setup.py needs a git repo to generate necessary version file
source=("git+https://github.com/virtuald/pyhcl.git#commit=$_commit")
sha256sums=('SKIP')

build() {
  cd $_pkgname
  python -m build --wheel --no-isolation
}

check() {
  cd $_pkgname
  PYTHONPATH="$PWD/src" pytest tests
}

package() {
  cd $_pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
}
