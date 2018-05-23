# Maintainer: G Queiroz <gabrieljvnq@gmail.com>
pkgname=openicp-br-git
pkgver=r123.1836c11
pkgrel=1
pkgdesc="Digital signatures tool according to Brazilian Law."
arch=('x86_64')
url="github.comn/gjvnq/OpenICP-BR"
license=('AGPL')
groups=()
depends=('wxgtk3' 'gtk-update-icon-cache')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" "${pkgname%}")
replaces=()
backup=()
options=()
install=
source=("${pkgname}::git+https://github.com/gjvnq/OpenICP-BR.git#branch=develop")
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	( set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	cd "$srcdir/${pkgname}"
	WX_CONFIG=/usr/bin/wx-config-gtk3 cmake . -DNO_TESTS=1
	make openicp
}

package() {
	cd "$srcdir/${pkgname%}"
	make DESTDIR="$pkgdir/" install
}
