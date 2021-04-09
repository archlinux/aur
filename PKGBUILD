# Maintainer: Dan Nixon <dan@dan-nixon.com>
pkgname=snapperoo-git
pkgver=r4.a7fad31
pkgrel=2
pkgdesc="A small, bare essentials utility for taking Btrfs snapshots."
arch=('any')
url="https://github.com/DanNixon/snapperoo"
license=('MIT')
depends=('bash' 'btrfs-progs' 'jq')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('snapperoo::git+https://github.com/DanNixon/snapperoo')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make prefix="${pkgdir}/usr" etcdir="${pkgdir}/etc" install install-systemd
}
