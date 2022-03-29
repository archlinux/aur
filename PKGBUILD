# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# The following guidelines are specific to BZR, GIT, HG and SVN packages.
# Other VCS sources are not natively supported by makepkg yet.

# Maintainer: Nicholas Novak <34256932+NickyBoy89@users.noreply.github.com>
# Contributor: Cara Salter <cara@devcara.com>
pkgname=uxn-git # '-bzr', '-git', '-hg' or '-svn'
pkgver=r1458.47f65c7
pkgrel=1
pkgdesc="An assembler and emulator for Uxn"
arch=('x86_64')
url="https://100r.co/site/uxn.html"
license=('MIT')
groups=()
depends=('sdl2')
makedepends=('git') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=('uxnasm' 'uxnemu' 'uxncli')
conflicts=("${pkgname%-VCS}")
replaces=()
backup=()
options=()
install=
source=('uxn::git+https://git.sr.ht/~rabbits/uxn')
noextract=()
md5sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "$srcdir/uxn"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/uxn"

	# Don't run the example projects on build
	./build.sh --no-run
}

package() {
	cd "$srcdir/uxn"

	# Install the assembler
	install -vDm 755 bin/uxnasm "$pkgdir/usr/bin/uxnasm"

	# Install both the gui and command line emulators
	install -vDm 755 bin/uxnemu "$pkgdir/usr/bin/uxnemu"
	install -vDm 755 bin/uxncli "$pkgdir/usr/bin/uxncli"
}
