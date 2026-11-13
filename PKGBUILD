# Maintainer: Stefan Gehr <stefan@gehr.xyz>

pkgname=python-lyricsgenius
_name=lyricsgenius
pkgver=3.16.0
pkgrel=2
pkgdesc="A Python client for the Genius.com API, that provides a simple interface to the song, artist, and lyrics data stored on Genius.com"
arch=('any')
url="https://github.com/johnwmillr/LyricsGenius"
license=('MIT')
depends=('python' 'python-beautifulsoup4' 'python-requests')
makedepends=('python-build' 'python-installer' 'python-hatchling' 'python-hatch-vcs')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
b2sums=('fb79017aa1ce1963b2e2dc2cae17e675a63abb27a920dbddebbb87f571f2ca54a97ad04955ab9c0d7251053ea0367329fa452e52c2f1d37a8fd5b1c8467646b1')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
