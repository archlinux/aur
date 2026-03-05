#maintainer='Ewout Baars <ewoutbaars0901@gmail.com>'

pkgname=python-hatch-gettext
pkgver=1.1.1
pkgrel=1
pkgdesc='Hatch build hook plugin for GNU gettext'
arch=('any')
url='https://github.com/damonlynch/hatch-gettext'

license=('GPL-3.0-or-later')
depends=(
  'python'
  'python-hatchling'
  'python-rich'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-packaging'
)

_pkgreponame=hatch-gettext
_pkgfoldername=hatch_gettext

source=(https://github.com/damonlynch/${_pkgreponame}/releases/download/v${pkgver}/${_pkgreponame}-${pkgver}.tar.gz{,.asc})
sha256sums=('dd45d0d097f5b8e7c68b7c3c1c6cb6b5e7dc81a5b44da8be45e3f5034d0a1cd9'
            'SKIP')
validpgpkeys=('E26048A9F4A803B91CB1BD648005B1F36970BE28') # Damon Lynch <damonlynch@gmail.com>


build() {
  cd "$srcdir/${_pkgfoldername}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/${_pkgfoldername}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
