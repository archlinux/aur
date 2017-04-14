# Maintainer: aksr <aksr at t-com dot me>
pkgname=epic5-git
pkgver=2.0.1.r57.g495cd72
pkgrel=1
epoch=
pkgdesc="Enhanced Programmable ircII Client"
arch=('i686' 'x86_64')
url="http://www.epicsol.org/"
license=('custom')
categories=()
groups=()
depends=('libarchive' 'ncurses' 'openssl' 'perl' 'tcl')
makedepends=('git')
optdepends=()
checkdepends=()
provides=()
conflicts=('epic5')
replaces=()
backup=()
options=()
changelog=
install=
source=("$pkgname::git+http://git.epicsol.org/epic5.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g;s/^epic5.//'
}

build() {
  cd "$srcdir/$pkgname"
  ## ICONV problem
  unset CPPFLAGS
  ./configure --prefix=/usr --with-ssl --with-ipv6 --with-perl --with-tcl
  make

}

package() {
  cd "$srcdir/$pkgname"
  make prefix="$pkgdir/usr" libexecdir="$pkgdir/usr/bin" \
       mandir="$pkgdir/usr/share/man" infodir="/usr/share/info" install
  install -Dm644 COPYRIGHT $pkgdir/usr/share/licenses/${pkgname%-*}/COPYRIGHT
  #mkdir -p $pkgdir/usr/share/doc/$pkgname
  #cp -r doc/* $pkgdir/usr/share/doc/$pkgname/

}

