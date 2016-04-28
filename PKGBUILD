# Maintainer: Ramana Kumar <ramana at member dot fsf dot org>
pkgname=polyml-fixes-git
pkgver=5.6r2078.167eaf7
pkgrel=1
pkgdesc="Poly/ML implementation of Standard ML (latest release + fixes)"
arch=('i686' 'x86_64')
url="http://polyml.org"
license=('LGPL')
groups=()
depends=('gmp')
makedepends=('git')
provides=("${pkgname%-fixes-git}" "${pkgname%-fixes-git}-git")
conflicts=("${pkgname%-fixes-git}" "${pkgname%-fixes-git}-git" "${pkgname%-fixes-git}-svn")
replaces=("${pkgname%-fixes-git}-svn")
backup=()
options=('staticlibs')
install=
source=('git+https://github.com/polyml/polyml.git#branch=fixes-5.6')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-fixes-git}"
	printf "5.6r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-fixes-git}"
	./configure --prefix=/usr
	make
  make compiler
}

check() {
	cd "$srcdir/${pkgname%-fixes-git}"
	make check
}

package() {
	cd "$srcdir/${pkgname%-fixes-git}"
	make DESTDIR="$pkgdir/" install
}
