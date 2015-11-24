# Contributor: Chris Brannon <cmbrannon (at) cox.net>
# Contributor: joyfulgirl <joyfulgirl (at) archlinux.us>
# Contributor: Chuck Boucher <jofywyxaxukyvofa (at) tempomail.fr>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=edbrowse
pkgver=3.5.4.2
pkgrel=1
epoch=
pkgdesc="A line-oriented editor, browser and mail client."
arch=('i686' 'x86_64')
url="http://edbrowse.org/"
license=('GPL' 'openssl')
groups=()
depends=('js>=2.4' 'openssl' 'pcre' 'curl>=7.17.0' 'readline')
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
md5sums=('0fe3fffd3c6086e05c905ccf459844ef')
sha1sums=('55069248f3e54ed9dca332b90a817a07edb1a689')
sha256sums=('0c14da87ca1b6adb0ddc7b51e8d5392a58d9a8c2ae636385f38e7c6a4622551d')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make all
}

package() {
  cd "$srcdir/$pkgname-$pkgver/src"
  make DESTDIR="$pkgdir" prefix=/usr install
  mkdir -p $pkgdir/usr/share/{doc/$pkgname,licenses/$pkgname,man/man1}
  cd $srcdir/$pkgname-$pkgver/doc
  install -m755 setup.ebrc "$pkgdir/usr/bin"
  install -m644 usersguide.html "$pkgdir/usr/share/doc/edbrowse"
  install -m644 philosophy.html "$pkgdir/usr/share/doc/edbrowse"
  install -m644 sample.ebrc "$pkgdir/usr/share/doc/edbrowse"
  install -m644 man-edbrowse-debian.1 "$pkgdir/usr/share/man/man1/edbrowse.1"
  cd $srcdir/$pkgname-$pkgver
  install -m644 README "$pkgdir/usr/share/doc/$pkgname/README"
  install -m644 CHANGES "$pkgdir/usr/share/doc/$pkgname/CHANGES"
  install -m644 todo "$pkgdir/usr/share/doc/$pkgname/TODO"
  install -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

