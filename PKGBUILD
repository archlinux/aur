# Maintainer: Stefan Gehr <stefan@gehr.xyz>

pkgname=python-lyricsgenius
_name=lyricsgenius
pkgver=3.18.1
pkgrel=1
pkgdesc="A Python client for the Genius.com API, that provides a simple interface to the song, artist, and lyrics data stored on Genius.com"
arch=('any')
url="https://github.com/johnwmillr/LyricsGenius"
license=('MIT')
depends=('python' 'python-beautifulsoup4' 'python-requests')
makedepends=('python-build' 'python-installer' 'python-hatchling' 'python-hatch-vcs')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
b2sums=('61b1a74f660130e1790b5d272db4f88d5b8ea1c1995d0a3fc63e61834f80a8ae31c6ddb95686321eba895824f02ba9318373d628b6e87f4668fc85c4c0330e5b')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
