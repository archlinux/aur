# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
pkgname=cmakew
pkgver=0.2.0
pkgrel=4
pkgdesc="CMake wrapper CLI tool"
arch=('any')
url="https://github.com/thombashi/${pkgname}"
license=(MIT)
depends=(python-logbook python-six python-subprocrunner python-typepy)
makedepends=(python-setuptools)
source=(https://pypi.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('5576877252e2ef2e3e0638eaa921f97e1a713b406061fcf4bda1b1703e8fd95ef858c1cba3d8951a1f09990128ba6b382b30dacffc6f808fc8f2f86f5c16578f')

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dvm644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dvm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}