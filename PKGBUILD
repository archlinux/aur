# Maintainer: aksr <aksr at t-com dot me>
pkgname=slrn-git
pkgver=1.0.1.r36.g4861cf1
pkgrel=1
epoch=
pkgdesc="An open source text-based news client."
arch=('i686' 'x86_64')
url="http://www.slrn.org/"
license=('GPL')
groups=()
depends=('openssl' 'slang')
makedepends=('git' 'uudeview')
optdepends=('metamail')
checkdepends=()
provides=('slrn')
conflicts=('slrn')
replaces=()
backup=()
options=('!makeflags' 'docs' 'zipman')
changelog=
install=
source=("$pkgname::git+git://git.jedsoft.org/git/slrn.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --tags | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --enable-setgid-code \
              --with-slrnpull \
              --with-ssl \
              --with-uu \
              --with-uulib=/usr/lib/uudeview \
              --with-uuinc=/usr/include/uudeview \
              --enable-spoilers
  make UUDEVIEW_LIB="/usr/lib/uudeview/*.o"
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install
  install -D -m644 doc/slrn.rc $pkgdir/etc/slrnrc

}

