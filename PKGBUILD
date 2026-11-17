# Maintainer: Stefan Gehr <stefan@gehr.xyz>

pkgname=python-lyricsgenius
_name=lyricsgenius
pkgver=3.18.0
pkgrel=1
pkgdesc="A Python client for the Genius.com API, that provides a simple interface to the song, artist, and lyrics data stored on Genius.com"
arch=('any')
url="https://github.com/johnwmillr/LyricsGenius"
license=('MIT')
depends=('python' 'python-beautifulsoup4' 'python-requests')
makedepends=('python-build' 'python-installer' 'python-hatchling' 'python-hatch-vcs')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
b2sums=('2b84b3e87bed9aedec54ae3de0efbaa907ccff93a2779dd73cb2f807d4755067de8a3fbc252d87135f9ef3e5eda8a83eaaa354d44f4261fb9c377d47cf7d1088')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
