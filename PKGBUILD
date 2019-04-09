# Maintainer: Hendrik Matvejev <hendrik.matvejev@gmail.com>

pkgname=python-lyricsgenius
_name=lyricsgenius
pkgver=1.4.0
pkgrel=1
pkgdesc="A Python client for the Genius.com API, that provides a simple interface to the song, artist, and lyrics data stored on Genius.com"
arch=('any')
url="https://github.com/johnwmillr/LyricsGenius"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-nose')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz" "https://raw.githubusercontent.com/johnwmillr/LyricsGenius/master/LICENSE.txt")
md5sums=('5d6ac03fecd844061502bbea704078db'
         '59df04cf30d3972c3e93b2e7436f4542')

build() {
  cd $_name-$pkgver
  python setup.py build
}

package() {
  depends=('python-beautifulsoup4' 'python-requests')

  cd $_name-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  cd $srcdir
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
