# Maintainer: Stefan Gehr <stefan@gehr.xyz>

pkgname=python-lyricsgenius
_name=lyricsgenius
pkgver=3.7.0
pkgrel=1
pkgdesc="A Python client for the Genius.com API, that provides a simple interface to the song, artist, and lyrics data stored on Genius.com"
arch=('any')
url="https://github.com/johnwmillr/LyricsGenius"
license=('MIT')
depends=('python-beautifulsoup4' 'python-requests')
makedepends=(python-build python-installer python-wheel python-setuptools python-hatchling)
checkdepends=('python-nose')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz" "https://raw.githubusercontent.com/johnwmillr/LyricsGenius/master/LICENSE.txt")
b2sums=("ee4b53935b7c5077cc6e8cec11e3395de9565c65d91c0a43154dbb17f69a4c17f54ef1c601ea7358b369654da263eb4d99e7ce7022a2dcc1efd9f97d26544ff1"
        "6337ed7547e2f1c91ef6a45d00f7110868ac241dcb4026baf5ff761afd4c7c686c4faa03fbbff2fe00d041a3241479b67553c12dfb2a1afc2326b0e60a9586ba")

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
