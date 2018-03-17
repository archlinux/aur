# Constributor: intel <intel@ss4200>
# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=flacsync  
pkgver=0.3.2
pkgrel=5
pkgdesc="Recursively mirror a directory tree of FLAC audio files to AAC/OGG"
url="https://github.com/cmcginty/flacsync"
arch=('any')
license=('GPL')
depends=('python2' 'python2-setuptools' 'python-imaging' 'mutagen' 'flac')
optdepends=('neroaacenc: AAC encoding'
            'neroaactag: AAC tagging'
            'vorbis-tools: OGG Vorbis encoding and tagging'
            'lame: MP3 encoding'
)
source=(https://github.com/cmcginty/flacsync/raw/master/dist/$pkgname-$pkgver.tar.gz pillow-import.patch)

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p1 < $srcdir/pillow-import.patch
  python2 setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root=$pkgdir/ --optimize=1 --skip-build
}

sha256sums=('9d2ea9ab37ac1ec670230b81cbefd0066b270d50e9088a0de2ba5a76a836388b'
            '0874222cd547164de12a70f6764917cc4d49fb2930ae36a6e9f6d185f0ab34a6')
