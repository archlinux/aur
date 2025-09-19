# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgauthor=darrenburns
_pkgname=elia
pkgname=${_pkgname}
pkgver=1.10.0
pkgrel=1
pkgdesc="A powerful terminal user interface for interacting with large language models"
arch=('any')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('Apache-2.0')
makedepends=('python-build' 'python-installer' 'python-hatchling')
depends=('python>=3.11' 'python-textual' 'python-sqlmodel>=0.0.9'
         'python-humanize>=4.6.0' 'python-click>=8.1.6'
         'python-xdg-base-dirs>=6.0.1' 'python-aiosqlite>=0.20.0'
         'python-click-default-group>=1.2.4' 'python-greenlet>=3.0.3'
         'python-google-generativeai>=0.5.3' 'python-pyperclip>=1.8.2'
         'litellm>=1.37.19' 'python-tiktoken' 'python-rich' 'python-sqlalchemy'
         'python-pydantic' 'python-yaml' 'python-tree-sitter-yaml'
         'python-tree-sitter-markdown')

_pkgsrc="${pkgname}-${pkgver}"

source=("${_pkgsrc}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('203663a38afe052238883cfba7c5dd83810765f848960c37e16a4e8d3f31bccc')

build () {
  cd "${srcdir}/${_pkgsrc}"

  python -m build --wheel --no-isolation
}

package () {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd "${srcdir}/${_pkgsrc}"

  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
