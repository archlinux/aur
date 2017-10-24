# Contributor: Patrick Palka <patrick@parcs.ath.cx>
# Contributor: Fabio Pozzim <fabio.pozzi at anche dot no >
# Contributor: Nathan Owe <ndowens04 at gmail>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=tramp
pkgver=2.3.2
pkgrel=1
pkgdesc="emacs extension that provides transparent remote file editing"
arch=('any')
url=http://www.gnu.org/software/tramp/
license=('GPL')
makedepends=('emacs' 'texinfo')
# add texlive-core to the makedepends and comment in the last two lines
# of this PKGBUILD if you want the documentation in dvi-format
source=("ftp://ftp.gnu.org/gnu/tramp/$pkgname-$pkgver.tar.gz")
sha256sums=('7fb54fc8d27e01a50b8e3bf1817d77ef8aa91bb465e97446d5d603713927fcea')

prepare() {
  cd "$pkgname-$pkgver/texi"
  ln -s /usr/share/automake-1.15/texinfo.tex texinfo.tex
}

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr --with-contrib 
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  mv $pkgdir/usr/share/info/$pkgname $pkgdir/usr/share/info/$pkgname-new
#  install -Dm644 texi/$pkgname.dvi \
#    $pkgdir/usr/share/doc/$pkgname/$pkgname.dvi
}

