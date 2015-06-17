# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# The following guidelines are specific to BZR, GIT, HG and SVN packages.
# Other VCS sources are not natively supported by makepkg yet.

# Maintainer: VBChunguk <chwo9843@gmail.com>
pkgname=thtk-git # '-bzr', '-git', '-hg' or '-svn'
pkgver=r278.e69474d
pkgrel=1
pkgdesc="A collection of tools for exploring and modifying the Touhou game series"
arch=('i686' 'x86_64')
url="https://github.com/thpatch/thtk"
license=('BSD')
depends=('libpng')
makedepends=('git') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-git}=$pkgver")
conflicts=("${pkgname%-git}")
source=("$pkgname"::'git://github.com/thpatch/thtk.git')
md5sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$pkgname"
    autoreconf -fi
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/$pkgname"
	make DESTDIR="$pkgdir/" install
    install -m755 -d "$pkgdir/usr/share/licenses/$pkgname"
    install -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/"
}
