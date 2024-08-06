# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="textual-autocomplete"
pkgname="python-${_name}"
pkgver=2.1.0b0
pkgrel=1
pkgdesc="Easily add autocomplete dropdowns to your Textual apps"
arch=('any')
url="https://github.com/darrenburns/${_name}"
license=('MIT')
makedepends=('python-build' 'python-installer' 'python-poetry-core')
depends=('python' 'python-textual' 'python-typing_extensions' 'python-rich')
_pkgsrc="${_name}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('90a0fd722e725f3e35318c7e88db20510e71bde1cabba5964e253dd2bfdfc646')

build () {
  cd "${srcdir}/${_pkgsrc}"
  python -m build --wheel --no-isolation
}

package () {
  cd "${srcdir}/${_pkgsrc}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
