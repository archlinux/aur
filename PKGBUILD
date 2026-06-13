# Maintainer: Eisuke Kawashima <e DOT kawaschima+archlinux AT gmail DOT com>

_pkgname='asynq'
pkgname="python-${_pkgname}"
pkgdesc='a library for asynchronous programming in Python with a focus on batching requests to external services'
pkgver='1.6.0'
pkgrel=1
url='https://github.com/quora/asynq'
arch=(x86_64)
license=(Apache-2.0)
checkdepends=(python-pytest)
makedepends=(cython python-build python-installer python-wheel)
depends=(
  glibc ipython python python-pygments
  # AUR
  python-qcore
)
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/quora/asynq/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=(0cd3dd216b3e7fa89e1a34c9b363e7a7444d265700128611cb643ab8244e2e6618ea149be4ce0a9eef6536f919019a2546617a8043290046b836ded67a46d816)

build() {
  cd "${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${_pkgname}-${pkgver}"
  python -m pytest --ignore=asynq/tests/test_pyright.py
}

package() {
  cd "${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
