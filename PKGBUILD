# Maintainer: Chris Berkhout <chris@chrisberkhout.com>
pkgname=paps-git
pkgver=r86.37e6ca1
pkgrel=1
pkgdesc='UTF-8 to PostScript converter using Pango'
arch=('x86_64')
url='https://github.com/dov/paps'
license=('LGPL2')
depends=('pango')
makedepends=('git' 'glib2' 'intltool')
conflicts=('paps')
provides=('paps')
source=('git+https://github.com/dov/paps.git')
sha256sums=('SKIP')

_gitrepo=${pkgname%-git}

pkgver() {
  cd "${_gitrepo}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_gitrepo}"
  ./autogen.sh --prefix=/usr
  make
}

check() {
  cd "${srcdir}/${_gitrepo}"
  make check
}

package() {
  cd "${srcdir}/${_gitrepo}"
  make install DESTDIR="$pkgdir"
  install -D -m 644 COPYING.LIB "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
