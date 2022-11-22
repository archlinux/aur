# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: aksr <aksr at t-com dot me>

pkgname=pdfgrep-git
pkgver=2.1.2.r47.g8101228
pkgrel=2
pkgdesc="A commandline utility to search text in PDF files."
arch=('i686' 'x86_64')
url="https://gitlab.com/pdfgrep/pdfgrep/commits/master"
url="https://pdfgrep.org/"
license=('GPL')
depends=('poppler' 'libgcrypt' 'pcre')
makedepends=('git' 'asciidoc')
conflicts=('pdfgrep')
source=("${pkgname}::git+https://gitlab.com/pdfgrep/pdfgrep.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g;s/^v//'
}

build() {
  cd "${srcdir}/${pkgname}"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="${pkgdir}/" install
  install -Dm644 COPYING ${pkgdir}/usr/share/licenses/${pkgname%-*}/COPYING
}

