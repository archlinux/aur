# Maintainer: Dashon Wells <me@me.me>
# Contributor Michael Riegert <michael at eowyn net>
# Contributor: Evan McCarthy <evan@mccarthy.mn>
# Contributor: Sibren Vasse <arch@sibrenvasse.nl>
# Contributor: Clint Valentine <valentine.clint@gmail.com>
# Contributor: xiota <aur commenter>
# Contributor: yochananmarqos <aur commenter>

pkgname="catt"
pkgver=0.12.12
pkgrel=1
pkgdesc='Cast All The Things - Send videos from many, many online sources to your Chromecast.'
arch=('any')
url="https://github.com/skorokithakis/catt"
license=('BSD')
depends=(
    'python-click'
    'python-ifaddr'
    'python-requests'
    'python-pychromecast'
    'yt-dlp')
makedepends=(
  'python-installer'
  'python-poetry'
  'python-setuptools'
)
source=("$pkgname-$pkgver.tar.gz"::"$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('29b848dedc15b4d698e6b13fab1590d8e0a66844b8ecb320b43334cc133bbfd1')

build() {
  cd "$pkgname-$pkgver"
  GIT_DIR='.' python -m poetry build --format wheel
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  python -m installer --destdir="$pkgdir" dist/*.whl
}
