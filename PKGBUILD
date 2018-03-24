# Maintainer: aksr <aksr at t-com dot me>
pkgname=pdfgrep-git
pkgver=2.0.1.r28.g78b20c8
pkgrel=1
epoch=
pkgdesc="A commandline utility to search text in PDF files."
arch=('i686' 'x86_64')
url="https://gitlab.com/pdfgrep/pdfgrep/commits/master"
url="https://pdfgrep.org/"
license=('GPL')
groups=()
depends=('poppler' 'libgcrypt')
makedepends=('git' 'asciidoc')
optdepends=()
checkdepends=()
provides=()
conflicts=('pdfgrep')
replaces=()
backup=()
options=()
changelog=
install=
source=("$pkgname::git+https://gitlab.com/pdfgrep/pdfgrep.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g;s/^v//'
}

build() {
  cd "$srcdir/$pkgname"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install
  install -Dm644 COPYING $pkgdir/usr/share/licenses/${pkgname%-*}/COPYING
}

