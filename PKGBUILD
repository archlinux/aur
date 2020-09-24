# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

_name=google-crc32c

pkgname=python-google-crc32c
pkgver=1.0.0
pkgrel=1
pkgdesc="A python wrapper of the C library 'Google CRC32C'"
arch=('any')
url="https://pypi.org/project/google-crc32c/"
license=('APACHE')
depends=(
  'python>=3.5'
  'python-cffi>=1.0.0'
)
makedepends=('python-setuptools')
options=(!emptydirs)
source=(
  "https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz"
)
sha256sums=(
  '9439b960b6ecd847557675d130fc3626d762bf535da595c20a6949a705fb3eae'
)

build() {
  # Google CRC32C is complex to compile at the moment. So only the pure Python implementation is used currently.

  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
