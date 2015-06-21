pkgname=gnuserv
pkgver=3.12.8
pkgrel=1
pkgdesc="gnuserv with gnu emacs compatability layer"
arch=('i686' 'x86_64')
url="http://meltin.net/hacks/emacs/"
license="GPL"
depends=('bash')
makedepends=()
conflicts=()
replaces=()
backup=()
install="$pkgname.install"
source=(http://meltin.net/hacks/emacs/src/gnuserv-3.12.8.tar.gz)
md5sums=('3173682652726fa3685a4cf2193c27e4')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make prefix=$startdir/pkg/usr install
  mkdir -p $startdir/pkg/usr/share/emacs/site-lisp
  make prefix=$startdir/pkg/usr install-elisp
  cp gnuserv-compat.el{,c} $startdir/pkg/usr/share/emacs/site-lisp/
  cp devices.el{,c} $startdir/pkg/usr/share/emacs/site-lisp/  
}