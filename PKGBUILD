# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Philipp Hug <arch@hug.cx>
pkgname=chipsec-dkms-git
pkgver=1.8.1.r19.g90fc2bec
pkgrel=1
epoch=
pkgdesc="Platform Security Assessment Framework"
arch=("x86_64")
url="https://github.com/chipsec/chipsec"
license=('GPL2')
groups=()
depends=('python' 'dkms' 'nasm')
makedepends=('git')
checkdepends=()
optdepends=()
provides=('chipsec-dkms')
conflicts=('chipsec-dkms')
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname::git+https://github.com/chipsec/chipsec")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
	cd "$pkgname"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$pkgname"
}

build() {
	cd "$pkgname"
}

check() {
	cd "$pkgname"
}

package() {
	cd "$pkgname/drivers/linux"

	# Copy dkms.conf
	install -Dm644 dkms.conf "${pkgdir}"/usr/src/${pkgname}/dkms.conf
	
	# Set name and version
	sed -e "s/@_PKGBASE@/${pkgname}/" \
	    -e "s/@PKGVER@/${pkgver}/" \
	    -i "${pkgdir}"/usr/src/${pkgname}/dkms.conf
	
	# Copy sources (including Makefile)
	cp -r ./* "${pkgdir}"/usr/src/${pkgname}/
}
