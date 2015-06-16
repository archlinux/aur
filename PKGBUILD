# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# The following guidelines are specific to BZR, GIT, HG and SVN packages.
# Other VCS sources are not natively supported by makepkg yet.

# Contributor: Andrea Zucchelli <zukka77@gmail.com>
pkgname=monicelli-git # '-bzr', '-git', '-hg' or '-svn'
pkgver=r171.f229f3f
pkgrel=1
pkgdesc="An esoterical programming language based on the so-called \"supercazzole\" from the movie Amici Miei, a masterpiece of the Italian comedy."
arch=('i686' 'x86_64')
url="https://github.com/esseks/monicelli"
license=('GPL3')
groups=()
depends=()
makedepends=('git' 'bison>=3' 'flex>=2.5' 'cmake') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('monicelli::git+https://github.com/esseks/monicelli.git')
noextract=()
md5sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "$srcdir/${pkgname%-git}"


# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

prepare() {
	cd "$srcdir/${pkgname%-git}"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	if [ ! -d build ];then
		mkdir build
	fi 
	cd build
	cmake ..
	make
}


package() {
	cd "$srcdir/${pkgname%-git}"
        install -D -m755 build/mcc  $pkgdir/usr/bin/mcc
	install -Dd -m755 examples $pkgdir/usr/share/${pkgname%-git}/examples 
	install -D -m644 examples/* -t $pkgdir/usr/share/${pkgname%-git}/examples 
	install -D -m755 Specification.txt $pkgdir/usr/share/${pkgname%-git}/Specification.txt
}
