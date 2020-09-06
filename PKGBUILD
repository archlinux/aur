# Maintainer: Soham Sen <aur at sohamsen dot me>
pkgname=python-swspotify
_name=SwSpotify
pkgver=1.2.1
pkgrel=1
pkgdesc="Cross-platform library to get the currently playing song and artist from Spotify w/o using the API or the internet. Very fast."
arch=('any')
url="https://github.com/SwagLyrics/SwSpotify"
license=('MIT')
depends=('python' 'python-flask' 'python-flask-cors' 'python-requests' 'python-dbus')
checkdepends=('python-pytest' 'python-mock')
makedepends=('python-setuptools')
source=("$_name-$pkgver.tar.gz::https://github.com/SwagLyrics/$_name/archive/v$pkgver.tar.gz")
sha256sums=('67b1565ff704068e3b809c4cd584f1bad8082106b1dd5ffb59208c0fb5d45b38')

build() {
    cd "$_name-$pkgver"
    python setup.py build
}

check() {
    cd "$_name-$pkgver"
    pytest tests/test_spotify.py::LinuxTests
}

package() {
    cd "$_name-$pkgver"
    python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE
}
