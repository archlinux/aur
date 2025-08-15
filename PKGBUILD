# Maintainer: Stefan Gehr <stefan@gehr.xyz>

pkgname=python-lyricsgenius
_name=lyricsgenius
pkgver=3.6.4
pkgrel=1
pkgdesc="A Python client for the Genius.com API, that provides a simple interface to the song, artist, and lyrics data stored on Genius.com"
arch=('any')
url="https://github.com/johnwmillr/LyricsGenius"
license=('MIT')
depends=('python-beautifulsoup4' 'python-requests')
makedepends=(python-build python-installer python-wheel python-setuptools python-hatchling)
checkdepends=('python-nose')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz" "https://raw.githubusercontent.com/johnwmillr/LyricsGenius/master/LICENSE.txt")
b2sums=('7c74446c3b08c8fbf2ea19f12142e255022292a277ecc5844997bc84ede0abe828fc3e6a0ba706043515fc4d7374cb4e332deab795f31d615dff87bc30b00e61'
        '6337ed7547e2f1c91ef6a45d00f7110868ac241dcb4026baf5ff761afd4c7c686c4faa03fbbff2fe00d041a3241479b67553c12dfb2a1afc2326b0e60a9586ba')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
