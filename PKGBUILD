#maintainer='Ewout Baars <ewoutbaars0901@gmail.com>'
pkgname=python-hatch-argparse-manpage
pkgver=1.0.1
pkgrel=1
pkgdesc='Hatch build hook plugin to automatically generate manual pages'
arch=('any')
url='https://github.com/damonlynch/hatch-argparse-manpage'
license=('GPL-3.0-or-later')
depends=(
  'python'
  'python-hatchling'
  'python-rich'
  'python-argparse-manpage'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-packaging'
)

_pkgreponame=hatch-argparse-manpage
_pkgfoldername=hatch_argparse_manpage

source=(https://github.com/damonlynch/${_pkgreponame}/releases/download/v${pkgver}/${_pkgreponame}-${pkgver}.tar.gz{,.asc})
sha256sums=('76cb65fb230e312f4b1bd78cbae8f237a14e784b9e246f53c35fd6f4adde6bac'
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
