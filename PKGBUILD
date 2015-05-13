# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Kipling Inscore <k@bijna.net>

pkgname=moosic
pkgver=1.5.6
pkgrel=2
pkgdesc="Music daemon with extensible format support (includes command line client)"
url="http://www.nanoo.org/moosic"
arch=(any)
# moosic does not refer to GPL version number but License.txt and the link on the webpage are version 2
license=('custom:unlicense')
# Python 2.7.2 may be overly cautious, but build/test failed previously with 2.6 and earlier
# Earlier versions of 2.7 have not been tested
depends=('python2>=2.7.2' 'findutils')
# moosic can control almost any media player program
# and is not actually limited to audio formats
# The optdepends list would be too long if comprehensive,
# so I've included only the programs in the default config file
optdepends=('mpg123: MP3 support'
            'vorbis-tools: Ogg Vorbis support'
            'timidity++: MIDI support'
            'mikmod: MOD, various other format support'
            'sox: WAV, various other support'
            'takcd: CD audio support')
source=("http://www.nanoo.org/moosic/download/$pkgname-$pkgver.tar.gz")
md5sums=('2bc5829d27f1aa5cc7f550517d205c75')


package() {
  cd $srcdir/$pkgname-$pkgver

  python2 setup.py install --root=$pkgdir/ --optimize=1
  install -Dm644 License.txt $pkgdir/usr/share/licenses/$pkgname/License.txt
}
