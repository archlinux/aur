# Maintainer: Dan Yeomans <dan@dyeo.net>

pkgname=rxargs-git
pkgver=0.2.2.r0.5240b5e
pkgrel=1
pkgdesc="Regex argument substitution for command-line wizardry"
arch=('x86_64')
url="https://github.com/dyeo/rxargs"
license=('MIT')
depends=('python')
makedepends=('git' 'python-setuptools' 'python-argparse-manpage')
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
  make build
}

package() {
  cd "$srcdir/${pkgname%-git}"
  make DESTDIR="$pkgdir/" install
  make man
  install -Dm644 "man/rxargs.1" "$pkgdir/usr/share/man/man1/rxargs.1"
}
