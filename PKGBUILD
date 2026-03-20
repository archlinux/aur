# Maintainer: Michal Wojdyla < micwoj9292 at gmail dot com >
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Patrick Palka <patrick@parcs.ath.cx>
# Contributor: Fabio Pozzim <fabio.pozzi at anche dot no >
# Contributor: Nathan Owe <ndowens04 at gmail>

pkgname=tramp
pkgver=2.8.1
pkgrel=2
pkgdesc="emacs extension that provides transparent remote file editing"
arch=('any')
url=https://www.gnu.org/software/tramp/
license=('GPL-3.0-or-later')
makedepends=('emacs' 'texinfo')
# add texlive-core to the makedepends and comment in the last two lines
# of this PKGBUILD if you want the documentation in dvi-format
source=("ftp://ftp.gnu.org/gnu/tramp/$pkgname-$pkgver.tar.gz"{,.sig})
sha256sums=('d20fcd12806567d52c47bcc0d41d68230a0c3a58b54ba64c7c674d0d29fd1269'
            'SKIP')
validpgpkeys=('C9A04D6E84B6DB548F4585A2AC966DC9E3E1AECA') # Michael Albinus

prepare() {
  cd $pkgname-$pkgver/texi
  [[ -L texinfo.tex ]] || ln -s /usr/share/automake-1.15/texinfo.tex texinfo.tex
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  mv "$pkgdir"/usr/share/info/$pkgname "$pkgdir"/usr/share/info/$pkgname-new
}
