# Contributor: Jan Oliver Oelerich <janoliver@oelerich.org>
pkgname=uwsgitop-git
pkgver=20230511
pkgrel=1
pkgdesc="uWSGI stats viewer"
arch=('i686' 'x86_64')
url="http://github.com/unbit/uwsgitop.git"
license=('GPL')
depends=('python2')
makedepends=('git' 'python2-distribute')
source=("git+https://github.com/unbit/uwsgitop.git")
b2sums=('SKIP')
_gitname="uwsgitop"

pkgver() {
  cd "$srcdir/$_gitname"
  git log -1 --format='%cd' --date=short | tr -d -- '-'
}

package() {
  cd "$srcdir/$_gitname"
  sed -i "s|#\!python|#\!/usr/bin/python2|" uwsgitop
  chmod +x uwsgitop
  python2 setup.py install --prefix=/usr --root="$pkgdir"
} 
