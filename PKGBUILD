# Maintainer: ricefrag <mpmjcvuut@protonmail.ch>

_pkgname=cathook
pkgname=cathook-git
pkgver=r511.5096a26
pkgrel=1
pkgdesc="Open source internal hack for Team Fortress 2"
arch=("any")
url="https://github.com/nullifiedcat/cathook"
license=("GPL3")
depends=("gdb" "sudo" "git" "gcc-multilib")
optdepends=('steam: To install Team Fortess 2')
sha256sums=('SKIP'
            '0742c77763c354819254032d162df7f5d22e30fa5c28e7733b3f38ec6124e7fc'
            '078a3e71b5a74e57d2939456f95dcee33a2650f5431f452298943ab856bb6dcf'
            '041dc783351a0115215604f40a8a1d8e40fab749005217edcb81fac65ec47349')

source=("${_pkgname}::git+${url}.git" "cathook-attach" "cathook-attach-backtrace" "cathook-detach")

pkgver() {
	cd "${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${_pkgname}"
	git submodule init
	git submodule update
	make -j$(grep "^processor" /proc/cpuinfo | wc -l) "$@"
}

package() {
	install -Dm755 cathook-attach "$pkgdir"/usr/bin/cathook-attach
	install -Dm755 cathook-detach "$pkgdir"/usr/bin/cathook-detach
	install -Dm755 ${_pkgname}/bin/libcathook.so "$pkgdir"/usr/lib/libcathook.so
}
