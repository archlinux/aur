# Maintainer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>
# Contributor: Charlie Grado

pkgname=nudoku-git
_gitname=nudoku
pkgver=2.0.0.r16.g676ed93
pkgrel=2
pkgdesc="Ncurses based Sudoku game for the terminal - Git version"
arch=('i686' 'x86_64')
url="https://jubalh.github.io/nudoku/"
license=('GPL3')
depends=('ncurses')
optdepends=('cairo: for PDF/PNG output (must be enabled manually with `configure --enable-cairo`)')
makedepends=('git' 'autoconf')
provides=('nudoku')
conflicts=('nudoku')
source=("git+https://github.com/jubalh/$_gitname.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${_gitname}"
	git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/${_gitname}"

	autoreconf -i
  ./configure --prefix=/usr
  ## To enable PDF/PNG output:
  # ./configure --prefix=/usr --enable-cairo
	make
}

package() {
	cd "$srcdir/${_gitname}"

  make DESTDIR="${pkgdir}" install
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
