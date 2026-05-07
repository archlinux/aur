# Maintainer: Victor <v1c70rp@gmail.com>

pkgname=python-timed-threads
_pkgname=timed_threads
pkgver=2.0.0
pkgrel=2
pkgdesc="Absolute time deadlines and thread cancelling for Python asynchronous threads"
arch=('any')
url="https://pypi.org/project/Timed-Threads"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
checkdepends=("python-pytest")
source=("$pkgname-$pkgver.tar.gz::https://github.com/Mathics3/$pkgname/releases/download/$pkgver/$_pkgname-$pkgver.tar.gz")
sha256sums=('49217b2d5e6218b5e1cce2d826722940f1d54fe1242260f2a8b53065529254c7')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  PYTHONPATH="." pytest test
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
