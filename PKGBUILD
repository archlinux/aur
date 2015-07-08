# Maintainer: Jashandeep Sohi <jashandeep.s.sohi@gmail.com>

pkgname=x2x-git
pkgver=git
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
 git describe --long --tags --always | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
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
