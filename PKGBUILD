# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Maintainer: Steven Allen <steven@stebalien.com>

pkgname=stapler-git
pkgver=0.2b.39.g8b5f409
pkgrel=1
pkgdesc="Manipulate PDF documents from the command line"
url="http://github.com/hellerbarde/stapler"
arch=('any')
license=('BSD')
depends=('python2-pypdf2' 'python2-setuptools')
makedepends=('git')
source=('git+https://github.com/hellerbarde/stapler.git')
md5sums=('SKIP')
_gitname="stapler"

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --always | sed 's|-|.|g'
}

prepare() {
  cd "$srcdir/$_gitname"
  sed -i '1s+python+python2+' stapler
  sed -i '1s+python+python2+' staplelib/tests.py
  sed -i '1s+python+python2+' staplelib/stapler.py
  sed -i 's/pypdf == 1.12/pypdf >= 1.12/' setup.py
}

check() {
  cd "$srcdir/$_gitname"
  python2 setup.py test
}

package() {
  cd "$srcdir/$_gitname"
  python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1

  install -Dm644 LICENSE $pkgdir/usr/share/licenses/stapler-git/LICENSE
  install -Dm644 README.md $pkgdir/usr/share/doc/stapler-git/README
}
