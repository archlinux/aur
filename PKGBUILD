# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

_srcname=pyinstrument

pkgname=python-pyinstrument
pkgver=3.1.1
pkgrel=1
pkgdesc="Call stack profiler for Python. Shows you why your code is slow!"
arch=('any')
url="https://github.com/joerick/pyinstrument"
license=('BSD')
depends=(
  'python-pyinstrument_cext>=0.2.2'
)
makedepends=(
  'npm'
  'python-pytest-runner'
  'python-setuptools'
)
options=(!emptydirs)
source=(
  "https://github.com/joerick/pyinstrument/archive/v${pkgver}.tar.gz"
)
sha256sums=(
  '19aefd4666371b349326a52717be4d0bc6ce8f0030d414da13deee703f60df4d'
)

prepare() {
  cd "${srcdir}/${_srcname}-${pkgver}"
  # no need to include test files
  rm test/__init__.py
}

build() {
  cd "${srcdir}/${_srcname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_srcname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
  install -Dm644 DESIGN.md "${pkgdir}/usr/share/doc/${pkgname}/DESIGN.md"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
