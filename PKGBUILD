# Maintainer: Neko_Rikka <yjzyl9008 at gmail dot com>

pkgname=python-pyfmodex-git
pkgver=r231.80b028b
pkgrel=4
pkgdesc="Python bindings for the FMOD Ex sound library"
arch=('x86_64')
url="https://github.com/tyrylu/pyfmodex"
license=('MIT')
depends=('python')
provides=('python-pyfmodex')
conflicts=('python-pyfmodex')
checkdepends=('python-pytest' 'python-pytest-cov')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'python-poetry' 'git')
optdepends=('fmodengine: FMOD Engine API and tools')
source=("git+https://github.com/tyrylu/pyfmodex.git")
md5sums=('SKIP')
install=$pkgname.install

pkgver() {
  cd pyfmodex
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

check() {
  cd pyfmodex
  export LD_LIBRARY_PATH="tests/lib/Linux"
  pytest -v --cov || true
}

build() {
  cd pyfmodex
  python -m build --wheel --no-isolation
}

package() {
  cd pyfmodex
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm0644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README" 
}
