# Maintainer: zfo <zfoofz1 at gmail dot com>

pkgname=libmir-git
_gitname=mir
pkgver=v0.13.2.2.g08a91a7
pkgrel=1
pkgdesc="Generic Numeric Library for the D Programming language"
arch=('i686' 'x86_64')
url="https://github.com/DlangScience/mir"
license=('BSL')
depends=('libphobos-devel' 'dmd')
makedepends=('git')
source=("git://github.com/DlangScience/$_gitname.git")
md5sums=('SKIP')
conflicts=('libmir')

pkgver() {
	cd "${srcdir}/${_gitname}"
	git describe --tags HEAD | sed 's/-/./g'
}

package() {
	mkdir -p $pkgdir/usr/include/dlang/dmd/mir
	cp -r $srcdir/$_gitname/source/mir/* $pkgdir/usr/include/dlang/dmd/mir/

	find $pkgdir/usr -type f | xargs chmod 0644

	# symlink for ldc
	mkdir -p $pkgdir/usr/include/dlang/ldc
	ln -s /usr/include/dlang/dmd/mir $pkgdir/usr/include/dlang/ldc/mir

	install -Dm644 $srcdir/$_gitname/LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
