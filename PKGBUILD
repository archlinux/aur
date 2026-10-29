# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com>
# Contributor: zhullyb <zhullyb@outlook.com>

pkgname=python-bsdiff4
pkgver=1.4.0
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
sha512sums=('fe4d82beba894ebf279f56becc14549b79185f2b271e9d710cf729a7b38d8ec2c7fb082b430c926016103071189b511ae97ee14bc0c68a34b3200925db6aed5e')

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

