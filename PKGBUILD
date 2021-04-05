# Maintainer: Dan Nixon <dan@dan-nixon.com>
pkgname=snapperoo-git
pkgver=r1.1b7b550
pkgrel=1
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
	install -Dm 755 snapperoo "${pkgdir}/usr/bin/snapperoo"
	install -Dm 644 snapperoo.json "${pkgdir}/etc/snapperoo.json"
	install -Dm 644 systemd/snapperoo@.service "${pkgdir}/usr/lib/systemd/system/snapperoo@.service"
	install -Dm 644 systemd/snapperoo@.timer "${pkgdir}/usr/lib/systemd/system/snapperoo@.timer"
}
