# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# The following guidelines are specific to BZR, GIT, HG and SVN packages.
# Other VCS sources are not natively supported by makepkg yet.

# Maintainer: Your Name <youremail@domain.com>
pkgname=galasm-git
pkgver=r31.290d0cf
pkgrel=1
pkgdesc="Very slightly modified version of Alessandro Zummo's GALasm 2.1, for programming GAL devices (non-commercial license)"
arch=(i686 x86_64)
url="https://github.com/daveho/GALasm"
license=('unknown')
depends=()
makedepends=(git make gcc) # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
options=()
source=("${pkgname%-git}::git+https://github.com/daveho/GALasm.git#branch=master")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}/src"
    make
}

package() {
	cd "$srcdir/${pkgname%-git}/src"
    mkdir -p $pkgdir/usr/bin
    cp ${pkgname%-git} $pkgdir/usr/bin
}
