# Maintainer: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>

pkgname=stikkit-git
pkgver=1.0.4.r6.g446a4ee
pkgrel=1
pkgdesc="Commandline tool to upload pastes to stikked pastebins"
arch=('i686' 'x86_64')
url="http://github.com/benapetr/stikkit"
license=('GPL')
makedepends=('git' 'cmake')
conflicts=('stikkit')
provides=('stikkit')
source=("$pkgname"::'git+https://github.com/benapetr/stikkit.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long | sed -E 's/^Release_//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname/stikkit"
  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd "$srcdir/$pkgname/stikkit"
  make DESTDIR="$pkgdir" install
}
