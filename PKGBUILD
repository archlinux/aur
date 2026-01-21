pkgname=python-ocp_gordon
_build_hash=81a573ea8950bab0e11a416dc5426ebfcbe64cea
pkgver=0.2.0
pkgrel=1
pkgdesc="A Python library for Gordon Surface interpolation using B-splines"
arch=(x86_64)
url="https://github.com/gongfan99/ocp_gordon"
license=(Apache-2.0)
depends=(
python-ocp
python-numpy
python-scipy
)
checkdepends=(
python-pytest
)
makedepends=(
git
python-setuptools-scm
python-build
python-installer
python-wheel
)

source=("git+https://github.com/gongfan99/ocp_gordon#commit=${_build_hash}")

sha256sums=('30c2615d1f7d9d36a00a3daaffce14490c835495b5b274b9a13dee9bfc1d170f')

pkgver() {
  cd ocp_gordon
  git describe --tags | rev | cut -d- -f2- | rev | sed 's/-/.r/' | sed 's/^v//'
}

prepare() {
  cd ocp_gordon
}

build() {
  cd ocp_gordon
  python -m build --wheel --no-isolation
}

check() {
  python -m venv --without-pip --system-site-packages --clear venv
  source venv/bin/activate
  python -m installer ocp_gordon/dist/*.whl

  python -m pytest ocp_gordon/tests

  deactivate
}

package() {
  cd ocp_gordon
  python -m installer --destdir="$pkgdir" dist/*.whl
}
