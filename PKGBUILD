# Maintainer: Leon Schumacher <youremail@domain.com>
# vim: ft=sh:
pkgname=runit-services
pkgver=feb30bc458
pkgrel=2
pkgdesc="A collection of services for runit - stolen from Artix Linux"
arch=('any')
url="https://gitea.artixlinux.org/artix/runit-services"
license=('unknown')
depends=('runit')
makedepends=('git')
source=("git+$url#commit=$pkgver")
sha256sums=('SKIP')

package() {
	local SVDIR="$pkgdir/etc/sv"
	chmod 755 "${pkgdir%/*}"
	mkdir -p "$SVDIR"

	cd "$pkgname"
	for i in *; do
		[ ! -d "$i" ] && continue
		case "$i" in lvm2|cryptsetup|apparmor|hdparm) continue ;; esac
		cp -r "$i/"* "$SVDIR"
	done
	find "$SVDIR" -type f -exec chmod 755 {} \;
}
