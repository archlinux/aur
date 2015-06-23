# Contributor: Chris Brannon <cmbrannon (at) cox.net>
# Contributor: joyfulgirl <joyfulgirl (at) archlinux.us>
# Contributor: Chuck Boucher <jofywyxaxukyvofa (at) tempomail.fr>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=edbrowse
pkgver=3.5.4
pkgrel=1
epoch=
pkgdesc="Editor, browser, and mail client based on /bin/ed."
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
md5sums=('b58fe2e97ff6eef543f03f059403963a')
sha1sums=('5ea0182655c70b4908d9da304d5f571fc05f43a1')
sha256sums=('9b8ef8c8b83a207f59999e9117b1f1f09ca498ccd08811782dd4d42081679225')

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

