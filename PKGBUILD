# Maintainer: Hendrik Matvejev <hendrik.matvejev@gmail.com>

pkgname=python-lyricsgenius
_name=lyricsgenius
pkgver=1.3.1
pkgrel=1
pkgdesc="A Python client for the Genius.com API, that provides a simple interface to the song, artist, and lyrics data stored on Genius.com"
arch=('any')
url="https://github.com/johnwmillr/LyricsGenius"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-nose')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz" "https://github.com/johnwmillr/LyricsGenius/blob/master/LICENSE.txt")
md5sums=('35fa7b5ca01d5c8e546837f38fa332a5'
         'fab7a123dc179620410801c5c93c1621')

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
