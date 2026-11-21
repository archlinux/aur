# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com>
# Contributor: zhullyb <zhullyb@outlook.com>

pkgname=python-bsdiff4
pkgver=1.4.4
pkgrel=1
pkgdesc="Binary diff and patch using the BSDIFF4-format"
arch=('x86_64')
url="https://github.com/ilanschnell/${pkgname##*-}"
license=('BSD-3-Clause'
         'BSD-Protection')
depends=('python')
makedepends=('python-build'
             'python-installer'
             'python-setuptools'
             'python-wheel')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha512sums=('cb6c008053808567283d012f948401551334eeaaa2a0b397d3465cbbebc6a7a96787f3c625955a7b6677102b252b31b6afe405f1e2f6e9da8228fd3fa7458e3d')

build() {
  cd "${pkgname##*-}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname##*-}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  head -n 28 LICENSE > "LICENSE-${pkgname}"
  head -n +29 LICENSE > LICENSE-cx_bsdiff
  rm LICENSE  
  install -vDm0644 "LICENSE-${pkgname}" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-${pkgname}"
  install -vDm0644 "LICENSE-cx_bsdiff" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-cx_bsdiff"
}

