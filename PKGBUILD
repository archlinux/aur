# Maintainer: aksr <aksr at t-com dot me>
pkgname=epic5
pkgver=2.1.1
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
md5sums=('ea382519d5cc2b0b8c23bd3e1a2affb2')
sha1sums=('ffbf8a79951ee7dd64747d53b21a9c64a7542be6')
sha256sums=('b218a692a740c7e9faea7c701c12f54568fcb634939b646a1c43a2580be4ab9d')

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

