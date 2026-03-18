# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="pcg-cpp"
pkgver=0.98.1
pkgrel=1
pkgdesc="C++ implementation of the PCG family of random number generators"
arch=(
  'any'
)
url="http://www.pcg-random.org"
_url="https://github.com/imneme/${pkgname}"
license=(
  'Apache-2.0 OR MIT'
)
_pkgsrc="${_url##*/}-${pkgver}"
source=(
  "${_url}/archive/refs/tags/v${pkgver}/${_pkgsrc}.tar.gz"
)
b2sums=('f351279e6ef3d834c703bca2b017f81a1b8905b91589056cc0ee5dea6d5b5437992fda8a5e3c236dd6eb6ff9f0fe38b68fbfe89b752e6edf40b438878967e19b')

check() {
  cd "${srcdir}/${_pkgsrc}"
  make test
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  sed -e "s|\$PREFIX/|${pkgdir}/usr/|g" \
      -i 'Makefile'

  install -vd "${pkgdir}/usr/include"
  make PREFIX="${pkgdir}/usr" install

  install -vDm644 "README.md"   "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
