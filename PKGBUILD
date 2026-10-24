# Maintainer: Simone Riva <simone.rva at gmail dot com>
# Contributor: Radu Potop <radu@wooptoo.com>

_name=dr14_t.meter
pkgname=dr14_tmeter
pkgver=2.1.2
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
sha256sums=('695f50aeb408ebc7af1a8ee4e40cc37648f09037304d489629b2b4d5e29e45c8')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md dr14_algorithm.md
}
