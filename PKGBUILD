# Maintainer: Damian Höster <damian dot hoester at posteo dot de>

_pkgname=alabamaencoder
pkgname=${_pkgname}-git
pkgver=0.5.3.c338.b0109ee
pkgrel=1
pkgdesc='Video encoder framework with a focus on chunked target quality encoding'
arch=(x86_64)
url=https://github.com/kingstefan26/alabamaEncoder
license=(MIT)
depends=(
  python-scenedetect
  python-tqdm
  python-celery
  python-redis
  python-psutil
  python-opencv
  python-requests
  python-torf
  python-websockets
  python-scipy
  python-numpy
  python-scikit-image
  python-argparse-range
  python-matplotlib
)
makedepends=(
  git
  python-build
  python-installer
)
provides=($_pkgname)
conflicts=($_pkgname)
source=($_pkgname::git+$url.git)
sha256sums=(SKIP)

pkgver() {
  cd $_pkgname
  local _version=$(grep -oP "version=\"\K[^\"]+" setup.py)
  printf %s.c%s.%s $_version $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

build() {
  cd $_pkgname
  python -m build --wheel --no-isolation
}

package() {
  cd $_pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
