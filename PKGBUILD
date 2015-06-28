# Maintainer: aksr <aksr at t-com dot me>
pkgname=scrollz-git
pkgver=2.2.3.r36.gc97e764
pkgrel=1
pkgdesc="An advanced IRC client based on ircII client."
arch=('i686' 'x86_64')
url="https://github.com/ScrollZ/ScrollZ"
license=('custom')
groups=()
depends=('ncurses' 'openssl')
makedepends=('git')
optdepends=()
provides=('scrollz')
conflicts=('scrollz')
replaces=()
backup=()
options=()
install=
source=("$pkgname::git+git://github.com/ScrollZ/ScrollZ.git"
        "makefile.diff")
noextract=()
md5sums=('SKIP'
         '08ffe17576bc23bdb791ea3e502ef633')
sha1sums=('SKIP'
          '00124cf382288b304a094e8084311b6f46130ed2')
sha256sums=('SKIP'
            'd31c99074e27dcdad369c93cdd175af64cf7e564dbe976c9e2bc6ebf4b8048f3')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g;s/ScrollZ.//'
}

prepare() {
  cd $srcdir/$pkgname
  patch -p1 -i $srcdir/makefile.diff
}

build() {
  cd $srcdir/$pkgname
  ./configure --prefix=/usr   \
              --enable-regexp \
              --enable-fish   \
              --enable-ipv6   \
              --with-openssl  \
              --with-default-server=chat.freenode.net:6667
  make
}

package() {
  cd $srcdir/$pkgname
  make DESTDIR="$pkgdir/" install
  install -Dm644 COPYRIGHT $pkgdir/usr/share/licenses/$pkgname/COPYRIGHT
}

