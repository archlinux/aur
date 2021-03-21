# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# The following guidelines are specific to BZR, GIT, HG and SVN packages.
# Other VCS sources are not natively supported by makepkg yet.

# Maintainer: Your Name <youremail@domain.com>
pkgname='jim'
pkgver=0
pkgrel=1
pkgdesc="SSH wrapper to connect to pre-defined servers"
arch=('x86' 'x86_64')
url="https://github.com/CryoCodec/$pkgname"
license=('Apache')
groups=()
depends=('openssh' 'sshpass')
makedepends=('git' 'go' 'make')
provides=("${pkgname%-VCS}")
conflicts=("${pkgname%-VCS}")
replaces=()
backup=()
options=()
install=
source=("${pkgname}::git+https://github.com/zalintyre/${pkgname}.git")
noextract=()
md5sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "$srcdir/${pkgname}"
	printf "%s" "$(git describe --tags --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
    echo $pkgver
    git describe --tags --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g'
    echo $(pwd)
	cd "$srcdir/${pkgname}"
	make
}

# check() {
# 	cd "$srcdir/${pkgname}"
# 	make -k check
# }

package() {
	cd "$srcdir/${pkgname}"
	make DESTDIR="$pkgdir" install
}
