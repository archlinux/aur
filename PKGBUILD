# Maintainer: ricefrag <mpmjcvuut@protonmail.ch>

_pkgname=cathook
pkgname=cathook-git
pkgver=r515.4587895
pkgrel=1
pkgdesc="Open source internal hack for Team Fortress 2"
arch=("any")
url="https://github.com/nullifiedcat/cathook"
license=("GPL3")
depends=("gdb" "sudo" "git" "gcc-multilib")
optdepends=('steam: To install Team Fortess 2')
sha256sums=('SKIP'
            'SKIP'
            'ded605daadbd2954352e54d965d5b8310d80cb198acc6e21d0082564ddad9279'
            '078a3e71b5a74e57d2939456f95dcee33a2650f5431f452298943ab856bb6dcf'
            '041dc783351a0115215604f40a8a1d8e40fab749005217edcb81fac65ec47349')

source=("${_pkgname}::git+${url}.git" "git://github.com/ValveSoftware/source-sdk-2013.git"
"cathook-attach" "cathook-attach-backtrace" "cathook-detach")

prepare() {
	cd "${_pkgname}"
	git submodule init
	git config submodule.source-sdk-2013.url $srcdir/source-sdk-2013
	git submodule update
}

build() {
	cd "${_pkgname}"
	make -j$(grep "^processor" /proc/cpuinfo | wc -l) "$@"
}

package() {
	install -Dm755 cathook-attach "$pkgdir"/usr/bin/cathook-attach
	install -Dm755 cathook-detach "$pkgdir"/usr/bin/cathook-detach
	install -Dm755 ${_pkgname}/bin/libcathook.so "$pkgdir"/usr/lib/libcathook.so
}
