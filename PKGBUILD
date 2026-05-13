# Maintainer: admin12121 <https://admin12121.com>
pkgname=encid
pkgver=1.0.1
pkgrel=1
pkgdesc='Terminal decoder and identifier for encodings, hashes, ciphertext, and CTF-style data'
arch=('any')
url='https://github.com/admin12121/encid'
license=('MIT')
depends=('python' 'python-bcrypt' 'python-cryptography')
makedepends=('python-build' 'python-installer' 'python-hatchling')
checkdepends=('python-bcrypt' 'python-cryptography')
source=("https://files.pythonhosted.org/packages/source/e/encid/encid-${pkgver}.tar.gz")
sha256sums=('84bfaa7acab503ebb7415607f2a6a98de796d94278989d3a545b8ff26277ea20')

build() {
  cd "${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${pkgname}-${pkgver}"
  python -m unittest discover -s tests -v
}

package() {
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
