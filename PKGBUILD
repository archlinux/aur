# Maintainer: Simone Riva <simone.rva at gmail dot com>
# Contributor: Radu Potop <radu@wooptoo.com>

_name=dr14_t.meter
pkgname=dr14_tmeter
pkgver=2.2.0
pkgrel=1
pkgdesc="Compute the DR14 dynamic range value of audio files"
arch=(any)
url="https://github.com/simon-r/$_name"
license=(GPL-3.0-or-later)
depends=(python python-numpy ffmpeg lame vorbis-tools)
makedepends=(python-build python-installer python-setuptools python-wheel)
optdepends=('python-matplotlib: plotting options'
            'python-scipy: --compress option'
            'python-mutagen: --tag option')
conflicts=(python-dr14_tmeter)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('125733b8dc99ec48beaa57293efb23dd937a7bf8342be7cccbd61ca6f33ff56b')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md dr14_algorithm.md
  install -Dm644 man/dr14_tmeter.1 "$pkgdir/usr/share/man/man1/dr14_tmeter.1"
}
