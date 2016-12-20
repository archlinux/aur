# Maintainer: Jashandeep Sohi <jashandeep.s.sohi@gmail.com>

pkgname=x2x-git
pkgver=r117.7d09ce2
pkgrel=1
pkgdesc='Allows the keyboard, mouse on one X display to be used to control another X display.'
arch=('i686' 'x86_64')
url='https://github.com/dottedmag/x2x'
license=('MIT')
depends=('xorg-server' 'libxtst')
makedepends=('git' 'libxtst')
provides=('x2x')
conflicts=('x2x')
source=($pkgname'::git+https://github.com/dottedmag/x2x.git')
md5sums=('SKIP')

pkgver() {
 cd "$srcdir/$pkgname"
 printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
 cd "$srcdir/$pkgname"
 ./bootstrap.sh
 ./configure --prefix="$pkgdir/usr"
 make
}

package() {
 cd "$srcdir/$pkgname"
 make install
 install -D -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: filetype=sh tabstop=1 expandtab
