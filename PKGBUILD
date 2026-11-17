# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com>
# Contributor: zhullyb <zhullyb@outlook.com>

pkgname=python-bsdiff4
pkgver=1.4.3
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
sha512sums=('6ec7bfe55e2229173cb2144b5a168faf1a0f7a83b82c83d70060e432838fc236349a66012398ffbc264fbb803601d19b6a61a4731909b2ec4a9a3e863512e0d9')

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

