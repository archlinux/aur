# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Dashon Wells <me@me.me>
# Contributor: Michael Riegert <michael at eowyn net>
# Contributor: Evan McCarthy <evan@mccarthy.mn>
# Contributor: Sibren Vasse <arch@sibrenvasse.nl>
# Contributor: Clint Valentine <valentine.clint@gmail.com>
# Contributor: xiota
pkgname=catt
pkgver=0.13.3
pkgrel=1
pkgdesc="Cast All The Things allows you to send videos from many, many online sources to your Chromecast."
arch=('any')
url="https://github.com/skorokithakis/catt"
license=('BSD-2-Clause')
depends=(
  'python-click'
  'python-ifaddr'
  'python-pychromecast'
  'python-requests'
  'yt-dlp'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-poetry-core'
  'python-wheel'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('52cc39af83b5a0c94768bc6e17b29dfc04dde50e9e6d191fa506566cb56a971c')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
