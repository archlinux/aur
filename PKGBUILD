# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="textual-autocomplete"
pkgname="python-${_name}"
pkgver=4.0.3
pkgrel=1
pkgdesc="Easily add autocomplete dropdowns to your Textual apps"
arch=('any')
url="https://github.com/darrenburns/${_name}"
license=('MIT')
depends=('python>=3.9' 'python-rich' 'python-textual>=2'
         'python-typing_extensions>=4.5')
makedepends=('python-build' 'python-hatchling' 'python-installer')
_pkgsrc="${_name//-/_}-${pkgver}"
source=("${_pkgsrc}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_pkgsrc}.tar.gz")
sha256sums=('3fcb353febbfc51063f84c673b26b0f427ff7bd457eb2fb006e35846213fdd2a')

build() {
  cd "${srcdir}/${_pkgsrc}"
  python -m build --wheel --no-isolation
}

package() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd "${srcdir}/${_pkgsrc}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -vd "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -vsf "${site_packages}/${_pkgsrc}.dist-info/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
