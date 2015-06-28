# Maintainer: aksr <aksr at t-com dot me>
pkgname=epic5
pkgver=1.1.10
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
md5sums=('fe7b72a3bb2f2ac1dd388e646aec422a')
sha1sums=('779d92be3b987f43d034324601138633394c254f')
sha256sums=('a21e36de45962ec6dab241b0148cb0275b670083d2aaacfa9e694026b8256b59')

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

