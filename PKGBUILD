# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# The following guidelines are specific to BZR, GIT, HG and SVN packages.
# Other VCS sources are not natively supported by makepkg yet.

# Maintainer: Your Name <youremail@domain.com>
pkgname=powerupp-git
pkgver=r78.0a12022
pkgrel=1
pkgdesc="Simple GUI for UPP"
arch=('x86_64')
url="https://github.com/azeam/powerupp"
license=('GPL3')
groups=()
depends=('upliftpowerplay' 'gtk3')
makedepends=('git')
provides=("${pkgname%-VCS}")
source=('powerupp-git::git+https://github.com/azeam/powerupp.git#branch=master')
md5sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/powerupp-git"
	make
}

package() {
	cd "$srcdir/${pkgname%-VCS}"
	make DESTDIR="$pkgdir/" install
}
