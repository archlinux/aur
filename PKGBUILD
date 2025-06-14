# Maintainer: Matilde Morrone <aur at morrone dot dev>

pkgname=verdi-git
pkgver=r248.be53f55
pkgrel=1
pkgdesc="The elegant Wayland compositor"
arch=('x86_64' 'aarch64')
url="https://github.com/verdiwm/verdi"
license=('EUPL-1.2')
groups=('verdi')
depends=(
	'gcc-libs'
	'glibc'
	'systemd-libs'
	'libinput'
)
makedepends=('git' 'cargo' 'clang' 'lld' 'libgit2')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/verdiwm/verdi.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	cargo xtask build
}

package() {
	cd "$srcdir/${pkgname%-git}"
	cargo xtask install --destdir $pkgdir
	install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
}
