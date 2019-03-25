# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# The following guidelines are specific to BZR, GIT, HG and SVN packages.
# Other VCS sources are not natively supported by makepkg yet.

# Maintainer: Your Name <youremail@domain.com>
pkgname=intel-power-control-git
pkgver=r14.5b53221
pkgrel=1
pkgdesc="GPU power management for Intel hardware on Linux"
url="https://github.com/jmechnich/intel-power-control"
arch=('x86_64')
license=('unknown')
groups=()
depends=(python)
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/jmechnich/intel-power-control')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {
	cd "$srcdir/${pkgname%-git}"
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
    mkdir -p "$pkgdir/usr/bin"
	make PREFIX="$pkgdir/usr/" install
}
