# Maintainer: aksr <aksr at t-com dot me>
pkgname=epic5
pkgver=2.0.1
pkgrel=1
epoch=
pkgdesc="Enhanced Programmable ircII Client"
arch=('i686' 'x86_64')
url="http://www.epicsol.org/"
license=('custom')
groups=()
depends=('libarchive' 'ncurses' 'openssl' 'perl' 'tcl')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://ftp.epicsol.org/pub/epic/EPIC5-PRODUCTION/$pkgname-$pkgver.tar.gz")
noextract=()
md5sums=('949d159a318c332814fac1db1afb4e52')
sha1sums=('427257fc86c32c9dd6fcb2ff9e51f2c47596a1fc')
sha256sums=('1a564eddeaadbb9d04af83d2df472df1c45bed8aa0c452ebbbe54e00c328e620')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ## ICONV problem
  unset CPPFLAGS
  ./configure --prefix=/usr \
      --with-ssl --with-ipv6 --with-perl --with-tcl \
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make prefix="$pkgdir/usr" libexecdir="$pkgdir/usr/bin" \
      mandir="$pkgdir/usr/share/man" infodir="/usr/share/info" install
  install -Dm644 COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname/COPYRIGHT"
  #mkdir -p $pkgdir/usr/share/doc/$pkgname
  #cp -r doc/* $pkgdir/usr/share/doc/$pkgname/
}

