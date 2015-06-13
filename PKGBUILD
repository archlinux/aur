# Maintainer: Brendan MacDonell <macdonellba at gmail dot com>

pkgname=s3ql
pkgver=2.13
pkgrel=1
pkgdesc="A full-featured file system for online data storage."
arch=('i686' 'x86_64')
url="https://bitbucket.org/nikratio/s3ql/overview"
license=('GPL3')
depends=('python' 'python-apsw' 'python-crypto' 'python-defusedxml' 'python-dugong>=3.2'
         'python-llfuse>=0.40-3' 'python-requests')
makedepends=('gcc')
source=(https://bitbucket.org/nikratio/s3ql/downloads/s3ql-$pkgver.tar.bz2)
md5sums=('361f74730a1bdc6644e4a1ba23d8782b')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  python setup.py install --root="$pkgdir" --optimize=1

  install -d -m 755 "$pkgdir/usr/share/doc/$pkgname"
  install    -m 744 doc/manual.pdf "$pkgdir/usr/share/doc/$pkgname/manual.pdf"

  # Install the text versions of the docs and contrib. These can be recursive, so
  # `install' isn't particularly useful.
  cp -r contrib rst "$pkgdir/usr/share/doc/$pkgname/"
  chown -R root:root "$pkgdir/usr/share/doc/$pkgname/"
  find "$pkgdir/usr/share/doc/$pkgname" -type f -exec chmod 'g-w,g+r,o-w,o+r' '{}' ';'
}
