# Maintainer: Kazuki Sawada <kazuki@6715.jp>
# Contributor: Lalit Maganti <laitmaganti@gmail.com>
# Contributor: Brendan MacDonell <macdonellba at gmail dot com>

pkgname=s3ql
pkgver=3.0
pkgrel=1
pkgdesc="A full-featured file system for online data storage."
arch=('i686' 'x86_64')
url="https://github.com/s3ql/s3ql/"
license=('GPL3')
depends=(
  'python'
  'python-cryptography'
  'python-defusedxml'
  'python-apsw'
  'python-llfuse'
  'python-dugong'
  'python-requests'
  'python-google-auth'
)
makedepends=('gcc')
install="s3ql.install"
source=(https://github.com/s3ql/s3ql/releases/download/release-$pkgver/s3ql-$pkgver.tar.bz2)
md5sums=('da7e4cc1ba0d22d277f240bc695422ea')

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
