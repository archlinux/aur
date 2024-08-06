# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="euporie"
pkgver=2.8.2
pkgrel=1
pkgdesc="Jupyter notebooks in the terminal"
arch=('any')
url="https://${pkgname}.readthedocs.io"
_url="https://github.com/joouha/${pkgname}"
license=('MIT')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
checkdepends=('python-pytest' 'python-pytest-asyncio')
depends=('python>=3.8' 'python-prompt_toolkit' 'python-pygments'
         'jupyter-nbformat' 'python-jupyter-client>=7.1' 'python-aenum'
         'python-typing_extensions' 'python-fastjsonschema'
         'python-platformdirs' 'python-pyperclip' 'python-imagesize'
         'python-markdown-it-py' 'python-linkify-it-py'
         'python-mdit_py_plugins' 'python-flatlatex' 'python-timg'
         'python-pillow>=9.0' 'python-sixelcrop' 'python-universal_pathlib'
         'python-fsspec' 'python-jupytext>=1.14.0' 'python-jupyter-core'
         'python-ipykernel' 'python-aiohttp' 'python-magic' 'python-asyncssh'
         'python-pylatexenc' 'python-html2text' 'python-matplotlib'
         'python-chafapy' 'python-sympy' 'python-rich' 'python-mtable'
         'python-teimpy' 'python-numpy' 'python-cairosvg' 'python-ziamath'
         'python-img2unicode')
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${_url}/archive/v${pkgver}.tar.gz")
sha256sums=('3a3c67bb3a998189b7b738158878eb2e31acda5e7d8063a4e90380207b0f3946')

build () {
  cd "${srcdir}/${_pkgsrc}"
  python -m build --wheel --no-isolation
}

check () {
  cd "${srcdir}/${_pkgsrc}"
  pytest
}

package () {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd "${srcdir}/${_pkgsrc}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm644 "README.rst"   "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "${pkgdir}${site_packages}/${_pkgsrc}.dist-info/licenses/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
