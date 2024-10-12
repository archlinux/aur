# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com>
# Contributor: zhullyb <zhullyb@outlook.com>

pkgname=python-bsdiff4
pkgver=1.2.5
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
sha512sums=('9aa78d99a0ac83a3b2fe6e7433569a3253b6a23c223d1961aca78c84f84bad1cac3570533b12a67449dd55e2ad750a99f72653f557e4c9d78320339c58ed4435')

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

