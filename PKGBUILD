# Contributor: Chris Brannon <cmbrannon (at) cox.net>
# Contributor: joyfulgirl <joyfulgirl (at) archlinux.us>
# Contributor: Chuck Boucher <jofywyxaxukyvofa (at) tempomail.fr>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=edbrowse
pkgver=3.6.0
pkgrel=1
epoch=
pkgdesc="A line-oriented editor, browser and mail client."
arch=('i686' 'x86_64')
url="http://edbrowse.org/"
license=('GPL' 'openssl')
groups=()
depends=('js>=2.4' 'openssl' 'pcre' 'curl>=7.17.0' 'readline' 'tidy-html5-git')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=('edbrowse-git')
replaces=()
backup=()
options=()
install=
changelog=
source=("http://edbrowse.org/$pkgname-$pkgver.zip")
noextract=()
md5sums=('721855af5420650a0e35a43643a0ae07')
sha1sums=('03f64fb4a313251f8fbf048d2f4830c3ded3821d')
sha256sums=('0970d0e2106baa1d91a9501f7933e3bbbf6740a079d0aaa42f0a37d1018ab83a')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make all
}

package() {
  cd "$srcdir/$pkgname-$pkgver/src"
  make DESTDIR="$pkgdir" prefix=/usr install
  mkdir -p $pkgdir/usr/share/{doc/$pkgname,licenses/$pkgname,man/man1}
  cd $srcdir/$pkgname-$pkgver/doc
  install -m644 usersguide.html "$pkgdir/usr/share/doc/edbrowse"
  install -m644 sample.ebrc "$pkgdir/usr/share/doc/edbrowse"
  install -m644 man-edbrowse-debian.1 "$pkgdir/usr/share/man/man1/edbrowse.1"
  cd $srcdir/$pkgname-$pkgver
  install -m644 README "$pkgdir/usr/share/doc/$pkgname/README"
  install -m644 CHANGES "$pkgdir/usr/share/doc/$pkgname/CHANGES"
  install -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

