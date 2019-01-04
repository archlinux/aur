pkgname=git-explode
depends=(git git-deps python python-ostruct python-setuptools)
pkgver=0.0.1
pkgrel=1
pkgdesc='Explode linear sequence of git commits into topic branches'
arch=(any)
url=https://github.com/aspiers/git-explode
license=(GPL2)
source=(https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz)
sha512sums=('49513e4ca5c1212b1fd2a5671d988c1fdc0644d9e5477acc5b5404fdd3af1390d01826edb72824511f3b93a2628bed762f44658c031ea4e7f948cc217ccd6764')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm 644 README.rst "$pkgdir/usr/share/doc/$pkgname/README"
}

# Depends on having the git repo instead of just the source tarball.
#
#checkdepends=(python-pytest python-pytest-cov)
#check() {
#  cd "$srcdir/$pkgname-$pkgver"
#  python setup.py test
#}
