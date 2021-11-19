# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# The following guidelines are specific to BZR, GIT, HG and SVN packages.
# Other VCS sources are not natively supported by makepkg yet.

# Maintainer: Cara Salter <cara@devcara.com>
pkgname=uxn-git # '-bzr', '-git', '-hg' or '-svn'
pkgver=r954.cf5af02
pkgrel=1
pkgdesc="An assembler and emulator for Uxn"
arch=('x86_64')
url="https://100r.co/site/uxn.html"
license=('MIT')
groups=()
depends=('sdl2')
makedepends=('git') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-VCS}")
conflicts=("${pkgname%-VCS}")
replaces=()
backup=()
options=()
install=
source=('uxn::git+https://git.sr.ht/~rabbits/uxn'
	'build.sh.patch')
noextract=()
md5sums=('SKIP'
	'1ba98c345b3efbd45964cb74c1cd7baa')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "$srcdir/uxn"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/uxn"
	patch -i "$srcdir/build.sh.patch"
}

build() {
	cd "$srcdir/uxn"
	./build.sh
}

check() {
	cd "$srcdir/uxn"
	echo "No checks"
}

package() {
	cd "$srcdir/uxn"
	mkdir -p "$pkgdir/usr/bin"
	cp ./bin/uxn* "$pkgdir/usr/bin/"
}
