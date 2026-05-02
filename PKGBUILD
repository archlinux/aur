# Maintainer: Zesko
pkgname=btrfs-desktop-notification-git
pkgver=r56.f976305
pkgrel=1
pkgdesc="Notifies you on the desktop when booting into a read-only system or when BTRFS warning/error messages appear in the dmesg log."
arch=('any')
url="https://gitlab.com/Zesko/btrfs-desktop-notification.git"
license=('GPL3')
depends=('libnotify' 'systemd')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" "snapper-snapshot-notification-git")
backup=("etc/${pkgname%-git}.conf")
source=('git+https://gitlab.com/Zesko/btrfs-desktop-notification.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -dm 755 "$pkgdir/usr/share/doc/${pkgname%-git}/"
	install -Dm 644 README.md CHANGELOG.md -t "$pkgdir/usr/share/doc/${pkgname%-git}/"
	cp -a usr etc "$pkgdir"
}
