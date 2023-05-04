# Maintainer: Thomas Jost <schnouki@schnouki.net>
# Contributor: BrainDamage
pkgname=beets-bandcamp
pkgver=0.1.4
pkgrel=3
pkgdesc='Plugin for beets to use bandcamp as an autotagger source.'
arch=('any')
url='https://github.com/unrblt/beets-bandcamp'
license=('GPL')
depends=('python' 'python-six' 'beets' 'python-requests' 'python-beautifulsoup4' 'python-isodate')
makedepends=('python-setuptools')
source=("https://github.com/unrblt/${pkgname}/archive/v${pkgver}.tar.gz"
        "fix-setup-py.patch")
sha256sums=('abe4a018f055e250f28a66cca16edbdb2f65bed771df370b25de5cac7c45f2b8'
            '583fafad33d978be57fcf2ab5db0d135f9b0e4b9fb948fe2cc2c71f7667ccc33')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -p0 < "${srcdir}/fix-setup-py.patch"

  # remove __init__.py, which is just a copy of beets own plugin init system and would conflict
  rm beetsplug/__init__.py
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --prefix="/usr"
}
