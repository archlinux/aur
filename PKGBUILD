# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Denis Kasak <dkasak|AT|termina.org.uk>

pkgname=python-pysocks-git
_projectname=pysocks
pkgver=20190919
pkgrel=4
pkgdesc='A SOCKS proxy client and wrapper for Python.'
arch=('any')
license=('BSD-3-Clause')
url='https://github.com/Anorov/PySocks'
depends=('python')
provides=('socksipy')
conflicts=('socksipy')
makedepends=('git' 'python-setuptools')
source=('setup.py'
        "$_projectname::git+https://github.com/Anorov/PySocks.git")
md5sums=('46900e68be3f54a3bba2199faba326df'
         'SKIP')

pkgver() {
  cd "$srcdir/$_projectname"
  git log -1 --format="%cd" --date=short | sed 's|-||g'
}

build() {
  cp "$srcdir/setup.py" "$srcdir/$_projectname/"
}

package() {
  cd "$srcdir/$_projectname"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}

# vim:set ts=2 sw=2 et:
