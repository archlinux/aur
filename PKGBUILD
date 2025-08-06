# Maintainer : dobo <dobo90_at_gmail.com>

_pkgname="clang_complete"
pkgname="vim-clang-complete-git"
pkgver=v1.8.r380.g75946de
pkgrel=1
pkgdesc='Plugin which uses clang for accurately completing C and C++ code. Git version.'
arch=(any)
url='https://github.com/Rip-Rip/clang_complete'
license=(custom)
depends=(vim-plugin-runtime clang python)
makedepends=(git)
conflicts=(vim-clang-complete)
source=(git+https://github.com/Rip-Rip/clang_complete
	set_default_library_path.patch)
md5sums=(SKIP
	c217f1489facdd8148bb5c3453380404)
install=${pkgname}.install

pkgver() {
	cd "$_pkgname"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd ${srcdir}
	patch -p0 < set_default_library_path.patch
}

package() {
	cd ${srcdir}/clang_complete


	# creating directories 
	install -d -m 755 ${pkgdir}/usr/share/vim/vimfiles/bin
	install -d -m 755 ${pkgdir}/usr/share/vim/vimfiles/doc
	install -d -m 755 ${pkgdir}/usr/share/vim/vimfiles/plugin/clang
	install -d -m 755 ${pkgdir}/usr/share/vim/vimfiles/plugin/snippets

	# copying files
	install -D -m 755 bin/cc_args.py ${pkgdir}/usr/share/vim/vimfiles/bin/cc_args.py
	install -D -m 644 doc/clang_complete.txt ${pkgdir}/usr/share/vim/vimfiles/doc/clang_complete.txt
	install -D -m 644 plugin/{clang_complete.vim,libclang.py,kinds.py} ${pkgdir}/usr/share/vim/vimfiles/plugin
	install -D -m 644 plugin/clang/* ${pkgdir}/usr/share/vim/vimfiles/plugin/clang
	install -D -m 644 plugin/snippets/* ${pkgdir}/usr/share/vim/vimfiles/plugin/snippets
	install -D -m 644 doc/clang_complete.txt ${pkgdir}/usr/share/licenses/${pkgname}/clang_complete.txt
}
