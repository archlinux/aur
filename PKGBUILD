# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com>
# Contributor: zhullyb <zhullyb@outlook.com>

pkgname=python-bsdiff4
pkgver=1.3.0
pkgrel=2
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
sha512sums=('2057b9aef3db2a0cb2ee74c98fe80ebcaf05bc1bd9ce9f38b99446aac5311981a7a5c5f28c5df18a2de8e814f5f39931544651fd6949b0f5f6c852625bade126')

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

