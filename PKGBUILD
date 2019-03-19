# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# The following guidelines are specific to BZR, GIT, HG and SVN packages.
# Other VCS sources are not natively supported by makepkg yet.

# Maintainer: Ning Humbert <galaxy0419@gmail.com>
pkgname=fastdriver-git # '-bzr', '-git', '-hg' or '-svn'
pkgver=v0.2.beta.1.g4b0f4fe
pkgrel=1
pkgdesc="Fast-ODP (Old-Driver-Protocol) command line tool, C++ implementation"
arch=('i686' 'x86_64')
url="https://gitlab.com/lackofdream/fastdriver"
license=('Apache')
depends=('crypto++' 'boost')
makedepends=('git' 'cmake') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=('fastdriver')
options=('!buildflags' 'staticlibs')
source=('git+https://gitlab.com/lackofdream/fastdriver.git')
md5sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

_gitname=fastdriver

pkgver() {
	cd $_gitname
	echo $(git describe --always | sed 's/-/./g')
}

build() {
	cd $_gitname/src
	mkdir build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX=/usr ..
	make VERBOSE=1
}

package() {
	cd $_gitname/src/build
	make DESTDIR="$pkgdir/" install
}
