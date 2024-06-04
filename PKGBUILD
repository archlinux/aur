# Maintainer: Giygas <no email>
_pkgname=wjt
pkgname="$_pkgname-git"
pkgver=0.24g931b8f9
pkgrel=1
pkgdesc="slider widget for X"
arch=(i686 x86_64)
url="https://github.com/ianremmler/wjt"
license=(MIT)
depends=(
	fontconfig
	freetype2
	libx11
)
optdepends=('libxinerama: Xinerama support')

makedepends=(git)
provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")
source=("git+https://github.com/ianremmler/wjt")
b2sums=('SKIP')

pkgver() {
	git -C $_pkgname describe | sed 's_[- /:]__g'
}

prepare() {
	cd $_pkgname
	[ -f ${SRCDEST}/config.h ] && cp "${SRCDEST}/config.h" .
	return 0
}

build(){
	make -C $_pkgname
}

package() {
	cd $_pkgname
	make PREFIX=/usr DESTDIR="$pkgdir" install
	install -vDm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
