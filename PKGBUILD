# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="n2"
pkgname="n2-docs"
pkgver=0.1.7
pkgrel=2
pkgdesc="HTML documentation for N2"
arch=('any')
url="https://github.com/kakao/${_name}"
license=('Apache-2.0')
makedepends=('doxygen' 'python-sphinx' 'python-breathe' 'python-exhale'
             'python-sphinx_rtd_theme' 'python-sphinxcontrib-napoleon'
             'python-n2')
_pkgsrc="${_name}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('387282837c6330d6fd8243ae9133c6ca1cd345d19ec3a5795fbe6219ce972fc7')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  sed -i "s|image:: docs|image:: /${PWD}/docs|g" README.rst
}

build() {
  cd "${srcdir}/${_pkgsrc}/docs"
  make html
}

package () {
  cd "${srcdir}/${_pkgsrc}/docs/_build"
  find "html" -type f -exec install -Dm644 "{}" "${pkgdir}/usr/share/doc/${_name}/{}" \;
}
