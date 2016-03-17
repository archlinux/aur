# Maintainer: aksr <aksr at t-com dot me>
pkgname=epic5
pkgver=2.0
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
md5sums=('43ae665bf59347c387b747c59c41b8ab')
sha1sums=('8ff73f2a01c63fb48d5b9b8cccb3ee9a86de4517')
sha256sums=('b80b7b301f030ba70b2e2cb0f23f2138e3fd546c03a2b7d53f2ee07541750377')

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

