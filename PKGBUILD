# Maintainer: Kyle Keen <keenerd@gmail.com>
pkgname=python2-backports.shutil_get_terminal_size
pkgver=1.0.0
pkgrel=4
pkgdesc="The get_terminal_size() function from Python 3.3"
arch=('any')
url="https://pypi.python.org/pypi/backports.ssl_match_hostname"
license=('MIT')
depends=('python2-backports')
makedepends=('python2-setuptools')
source=("https://github.com/chrippa/backports.shutil_get_terminal_size/archive/v$pkgver.tar.gz"
        fix-fallback.patch::"https://github.com/chrippa/backports.shutil_get_terminal_size/commit/afc5714b.patch")
md5sums=('82499a36a98dd7ed37c8678e6002a375'
         '071e696dba553fd4fcee24b1dfb8ef3a')

prepare() {
  cd backports.shutil_get_terminal_size-$pkgver
  patch -p1 -i ../fix-fallback.patch # fix fallback size on Linux
}

package() {
  cd "$srcdir/backports.shutil_get_terminal_size-$pkgver"
  python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=0
  rm "$pkgdir/usr/lib/python2.7/site-packages/backports/__init__.py"*
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
