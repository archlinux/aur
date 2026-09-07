# Maintainer: Kannan Thambiah <kannan.thambiah@mailbox.org>
# Contributor: Johannes Wienke <languitar@semipol.de>
# Contributor: bittin
# Contributor: Kennan Hunter <kennanhunter5@gmail.com>

pkgname=mopidy-mpd
pkgver=4.0.1
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
)
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-setuptools-scm' 'python-wheel')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mopidy/mopidy-mpd/archive/v${pkgver}.tar.gz")
sha256sums=('1e252ebd0757b2b0c7e84eb438de9ec56e386aa919ce4fe7c4cdf4c1b0c6b7d8')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
