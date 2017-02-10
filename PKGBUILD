# Contributor: Chris Brannon <cmbrannon (at) cox.net>
# Contributor: joyfulgirl <joyfulgirl (at) archlinux.us>
# Contributor: Chuck Boucher <jofywyxaxukyvofa (at) tempomail.fr>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=edbrowse
pkgver=3.6.2
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
md5sums=('d093ff0eccbc8f1394c18e8a2a51bd5e')
sha1sums=('20e66feae2035dc7b498fceb1d1b4cec40357b7a')
sha256sums=('e480325528a2f4dcff73a50d84040738d8bcfe90cfdc77006dd6247d88a9616c')

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

