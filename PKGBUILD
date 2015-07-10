# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=vm-bzr
pkgver=1506
pkgrel=1
pkgdesc="View Mail for Emacs"
arch=('i686' 'x86_64')
url="https://launchpad.net/vm"
license=('GPL')
depends=('emacs' 'stunnel')
makedepends=('bzr')
optdepends=('mailcrypt: for encrypted mails'
'bbdb: for using a rolodex-like db')
provides=('vm')
conflicts=('vm')
options=('!makeflags')
install=vm.install
source=("vm::bzr+https://code.launchpad.net/~vm/vm/trunk/")
md5sums=('SKIP')
_bzrmod="vm"

pkgver() {
  cd $srcdir/${_bzrmod}
  bzr revno
}

build() {
  cd "$srcdir/$_bzrmod"
  autoconf
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_bzrmod"
  make DESTDIR="$pkgdir/" install
}
