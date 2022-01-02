# Maintainer: Dan Yeomans <dan@dyeo.net>

pkgname=rxargs-git
pkgver=0.1.0.r0.891e55e
pkgrel=1
pkgdesc="Regex argument substitution for command-line wizardry"
arch=('x86_64')
url="https://github.com/dyeo/rxargs"
license=('GPL3')
depends=('python')
makedepends=('git' 'python-setuptools')
optdepends=()
provides=('rxargs')
source=('git+https://github.com/dyeo/rxargs.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/${pkgname%-git}"
  python setup.py build
}

package() {
  cd "$srcdir/${pkgname%-git}"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 "man/rxargs.1" "$pkgdir/usr/share/man/man1/rxargs.1"
}
