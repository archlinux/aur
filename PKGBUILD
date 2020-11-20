# Maintainer: Yann Büchau <nobodyinperson@posteo.de>
pkgname=camp2ascii-git
pkgver=r16.0f9d0a3
pkgrel=2
pkgdesc="Convert Campbell Scientific TOB3 files to other formats"
arch=('x86_64' 'aarch64')
url="https://github.com/nobodyinperson/camp2ascii"
license=('GPL')
groups=()
depends=()
makedepends=('git' 'gcc')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/nobodyinperson/camp2ascii')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
    if test "$CARCH" = "aarch64";then
        make ARCH=
    else
        make
    fi
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -m755 bin/camp2ascii -D -t "$pkgdir"/usr/bin/
}
