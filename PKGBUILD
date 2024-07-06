# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Jan Oliver Oelerich <janoliver@oelerich.org>
pkgname=uwsgitop-git
pkgver=20240401
pkgrel=3
pkgdesc="top-like app for monitoring uWSGI instances"
arch=('any')
url="https://github.com/xrmx/uwsgitop"
license=('MIT')
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
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
} 
