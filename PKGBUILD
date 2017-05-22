# Contributor: Chris Brannon <cmbrannon (at) cox.net>
# Contributor: joyfulgirl <joyfulgirl (at) archlinux.us>
# Contributor: Chuck Boucher <jofywyxaxukyvofa (at) tempomail.fr>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=edbrowse
pkgver=3.6.3
pkgrel=2
epoch=
pkgdesc="A line-oriented editor, browser and mail client."
arch=('i686' 'x86_64')
url="https://github.com/CMB/edbrowse"
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
source=("https://github.com/CMB/$pkgname/archive/v$pkgver.tar.gz")
noextract=()
md5sums=('18efb8489f186624a7367744e15ac170')
sha1sums=('e9d048b0322a340080d60372c005e1faf0a1ebef')
sha256sums=('f1ab7a113ea9465ef19c3ffa10e0b0466032c42acb55875243f5b859779d3b64')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make CFLAGS="-I/usr/include/tidy" all
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

