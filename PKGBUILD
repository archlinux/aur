# Maintainer: Ian Glen <ian@ianglen.me>
pkgname=lepton-eda-git
pkgver=1.9.13.20201211.r0.5babfbafe
pkgrel=1
pkgdesc="A suite of free software tools for designing electronics."
arch=('x86_64')
url="https://github.com/lepton-eda/lepton-eda"
license=('GPL')
groups=()
depends=('gtk2' 'gtk2+extra' 'guile' 'libstroke')
makedepends=('git' 'pkg-config' 'flex' 'gawk')
optdepends=('libstroke: mouse gesture support')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/lepton-eda/lepton-eda.git')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	./autogen.sh
	./configure --prefix=/usr --disable-update-xdg-database
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
}
