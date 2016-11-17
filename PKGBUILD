# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=vm-bzr
pkgver=8.2.0b1.r1516
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
source=("vm::bzr+https://code.launchpad.net/~vm/vm/trunk/")
md5sums=('SKIP')
_bzrmod="vm"

pkgver() {
  cd $srcdir/${_bzrmod}
  printf "%s.r%s" $(head -27 NEWS|tail -1| cut -c4-) $(bzr revno)
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
