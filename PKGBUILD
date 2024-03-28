# Maintainer: Anton Karmanov <a.karmanov@inventati.org>

pkgname=python-idzip
pkgver='0.3.9'
pkgdesc='Improved Dictzip: seekable, gzip compatible compression format'
pkgrel=1
arch=(any)
url="https://github.com/bauman/${pkgname}"
license=('MIT')
depends=('python' 'python-importlib-metadata')
optdepends=()
makedepends=('python-setuptools' 'python-build' 'python-wheel')
source=("${pkgname}::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('aefe24d8dee8e95f642a18043f266d434ab2adca5edc4642b5641e2667cccd75')
_tardir="${pkgname}-${pkgver}"

build() {
  cd "${srcdir}/${_tardir}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_tardir}"
  # python -m installer fails with FileExistsError
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dvm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
