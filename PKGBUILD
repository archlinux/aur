# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

_name=google-crc32c

pkgname=python-google-crc32c
pkgver=1.1.2
pkgrel=1
pkgdesc="A python wrapper of the C library 'Google CRC32C'"
arch=('any')
url="https://pypi.org/project/google-crc32c/"
license=('APACHE')
depends=(
  'python>=3.6'
  'python-cffi>=1.0.0'
)
makedepends=('python-setuptools')
optdepends=(
  'google-crc32c: using the c extension instead of a pure python implementation'
)
options=(!emptydirs)
source=(
  "https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz"
)
sha256sums=(
  'dff5bd1236737f66950999d25de7a78144548ebac7788d30ada8c1b6ead60b27'
)

build() {
  # Google CRC32C package is now here https://aur.archlinux.org/packages/google-crc32c/ .
  # But its install prefix is `/usr/local`.
  # To use it you need to change its install prefix to `/usr`.

  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
