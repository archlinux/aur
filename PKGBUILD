# Maintainer: Johannes Wienke <languitar@semipol.de>

pkgname=mopidy-local
pkgver=4.0.0a1
pkgrel=1
pkgdesc="Mopidy extension for local media playback"
arch=('any')
url="https://github.com/mopidy/mopidy-local"
license=('APACHE')
depends=('mopidy>=4.0.0a3'
         'python-setuptools'
         'python-uritools')
conflicts=('mopidy-local-images' 'mopidy-local-sqlite')
replaces=('mopidy-local-images' 'mopidy-local-sqlite')
provides=('mopidy-local-images' 'mopidy-local-sqlite')
makedepends=('python3' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools-scm')
source=("pyproject.patch" "${pkgname}-${pkgver}.tar.gz::https://github.com/mopidy/mopidy-local/archive/v${pkgver}.tar.gz")
sha256sums=('a4db5db63d4672b42bfc3986158ef61a6c4b3ec80df7de0637528bdb883854ef'
            '5b41e027cd2a4cecc901e89653cbaabd172efe8d6eca198e2a719ca0a350c454')

prepare() {
    cd $pkgname-$pkgver
    patch -Np1 -i ../pyproject.patch
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
