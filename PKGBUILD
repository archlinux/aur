# Maintainer: tlders <tlders@tlde.dev>

pkgname=apx-bin
pkgver=3.0.1
pkgrel=1
pkgdesc='Vanilla OS package manager based on Distrobox'
arch=(x86_64 aarch64)
url='https://github.com/Vanilla-OS/apx'
license=(GPL-3.0-only)
depends=(
  distrobox
  glibc
  flatpak
)
makedepends=(go)
source_x86_64=(
	"${pkgname}-${pkgver}-${arch}.tar.gz::https://github.com/Vanilla-OS/apx/releases/download/v${pkgver}/apx-amd64.tar.gz"
	"${pkgname}-configs.tar.gz::https://github.com/Vanilla-OS/vanilla-apx-configs/archive/37a7ce46c5387f70e99cb618532da90de31653f4.zip"
	"https://raw.githubusercontent.com/Vanilla-OS/apx/refs/heads/main/config/apx.json"
)
sha256sums_x86_64=(
	"SKIP"
	"SKIP"
	"SKIP"
)
provides=('apx')

package() {
	cd "$srcdir/"

	install -Dm755 apx "${pkgdir}/usr/bin/apx"

	install -d "${pkgdir}/usr/share/apx"

  	install -Dm644 "apx.json" "$pkgdir/usr/share/apx/config.json"

	cd "vanilla-apx-configs-37a7ce46c5387f70e99cb618532da90de31653f4/"

	cp -r stacks "${pkgdir}/usr/share/apx"

	cp -r package-managers "${pkgdir}/usr/share/apx"
}
