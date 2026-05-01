# Maintainer: Johannes Wienke <languitar@semipol.de>

pkgname=mopidy-local
pkgver=4.0.0
pkgrel=1
pkgdesc="Mopidy extension for local media playback"
arch=('any')
url="https://github.com/mopidy/mopidy-local"
license=('Apache-2.0')
depends=('mopidy>=4.0.0'
         'python-setuptools'
         'python-uritools')
conflicts=('mopidy-local-images' 'mopidy-local-sqlite')
replaces=('mopidy-local-images' 'mopidy-local-sqlite')
provides=('mopidy-local-images' 'mopidy-local-sqlite')
makedepends=('python3' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools-scm')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mopidy/mopidy-local/archive/v${pkgver}.tar.gz")
sha256sums=('d2654ba232c15d2a015bf3e5294bce8cd643bd5c0e574d1e587507d3c9b6df0f')

prepare() {
    cd $pkgname-$pkgver
}

build() {
    cd $pkgname-$pkgver
    export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python3 -m installer --destdir="$pkgdir/" dist/*.whl
}

# vim:set ts=4 sw=4 et:
