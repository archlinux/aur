_reponame=babel
pkgbase=python-babel-git
pkgname=(python-babel-git python2-babel-git)
pkgver=r878.ada7140
pkgrel=1
pkgdesc="A collection of tools for internationalizing Python applications"
url="http://babel.pocoo.org/"
license=("BSD")
arch=('any')
makedepends=('git' 'python' 'python2'
	    'python-setuptools' 'python2-setuptools'
	    'python-pytz' 'python2-pytz')
source=('git+https://github.com/mitsuhiko/babel.git')
sha512sums=('SKIP')

pkgver() {
  cd "$_reponame"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package_python-babel-git() {
  _pkgname='python-babel'
  provides=('python-babel')
  conflicts=('python-babel')
  depends=('python' 'python-pytz')

  cd $srcdir/babel
  python3 setup.py import_cldr
  python3 setup.py install --root=$pkgdir
  install -D -m0644 LICENSE $pkgdir/usr/share/licenses/$_pkgname/LICENSE
}

package_python2-babel-git() {
  _pkgname='python2-babel'
  provides=('python2-babel')
  conflicts=('python2-babel')
  depends=('python2' 'python2-pytz')

  cd $srcdir/babel
  python2 setup.py import_cldr
  python2 setup.py install --root=$pkgdir
  mv $pkgdir/usr/bin/pybabel $pkgdir/usr/bin/pybabel2
  install -D -m0644 LICENSE $pkgdir/usr/share/licenses/$_pkgname/LICENSE
}
