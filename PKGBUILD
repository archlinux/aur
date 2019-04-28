# Maintainer: Maarten de Vries <maarten@de-vri.es>
# Contributor: Mara Bos <m-ou.se@m-ou.se>
# Contributor: Maarten de Vries <maarten@de-vri.es>

pkgname=cloudabi-clang
pkgver=1
pkgrel=5
pkgdesc="Symlinks for the clang toolchain for CloudABI."
url='http://clang.llvm.org/'
arch=('any')
depends=(
	'clang>=3.9'
	'lld>=3.9'
)
replaces=(cloudabi-binutils)
conflicts=(cloudabi-binutils)
provides=(cloudabi-binutils)

license=(custom:LLVM)

_make_links() {
	local arch="$1"
	ln -s clang "$pkgdir/usr/bin/$arch-unknown-cloudabi-cc"
	ln -s clang "$pkgdir/usr/bin/$arch-unknown-cloudabi-c++"
	ln -s lld   "$pkgdir/usr/bin/$arch-unknown-cloudabi-ld"
}

package() {
	install -d "$pkgdir/usr/bin"

	_make_links x86_64
	_make_links i686
	_make_links aarch64
	_make_links armv6
}
