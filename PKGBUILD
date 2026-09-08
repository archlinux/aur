pkgname=soundcloud-dl
pkgver=3.0.8
pkgrel=1
pkgdesc="Souncloud music downloader"
url="https://github.com/scdl-org/scdl"
arch=(any)
depends=(
  'python-clint'
  'python-docopt'
  'python-mutagen'
  'python-termcolor'
  'python-requests'
  'python-pathvalidate'
  'python-soundcloud-v2'
  'python-filelock'

)
makedepends=(git python-installer python-build python-wheel)
source=("$pkgname-$pkgver.tag.gz::https://github.com/scdl-org/scdl/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c016ba03c37a97b7a971983f126c4e9b8960f036e6fbe984009787cbbd7457a4')

license=(GPL-2.0-only)

build() {
    cd "$srcdir/scdl-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/scdl-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    # remove tests to avoid conflicts
    _pyver=$(python3 -c 'import sys; print(f"{sys.version_info.major}.{sys.version_info.minor}")')
    rm -rf "$pkgdir/usr/lib/python${_pyver}/site-packages/tests"
}
