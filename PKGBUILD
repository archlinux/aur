# Maintainer: Your Name <your.email@example.com>

pkgname=python-pyfmodex
_pyname=pyfmodex
pkgver=0.7.2
pkgrel=4
pkgdesc="Python bindings for the FMOD Ex sound library"
arch=('x86_64')
url="https://github.com/tyrylu/pyfmodex"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("$_pyname-$pkgver.tar.gz::https://github.com/tyrylu/pyfmodex/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ac87a6816545e5c5ba5f21b37779f16395c4b93efe5514d72a7e50f5e9ccc548')

build() {
  cd "${_pyname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_pyname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 readme.md "${pkgdir}/usr/share/doc/${pkgname}/README"
}