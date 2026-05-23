# Maintainer: Kannan Thambiah <pygospa at gmail dot com>
# Contributor: Johannes Wienke <languitar@semipol.de>
# Contributor: bittin
# Contributor: Kennan Hunter <kennanhunter5@gmail.com>

pkgname=mopidy-mpd
pkgver=4.0.0
pkgrel=1
pkgdesc="Mopidy extension for controlling playback from MPD clients"
arch=('any')
url="http://www.mopidy.com"
license=('Apache-2.0')
depends=(
	'mopidy>=4.0'
	'glib2'
	'python'
	'python-gobject'
	'python-pykka'
	'python-setuptools'
)
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-setuptools-scm' 'python-wheel')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mopidy/mopidy-mpd/archive/v${pkgver}.tar.gz")
sha256sums=('56170e872ef41008c9e6e60e740e6eaf265ce7cb1aeef794f7d86bd4cb0d4a7e')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
