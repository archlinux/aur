# Maintainer: Patrick Spek <aur+lonestar@tyil.work>

pkgname="lonestar"
pkgver="1.0.1"
pkgrel="1"
pkgdesc="Installer for Rakudo Star Perl 6"
arch=("any")
url="https://github.com/tyil/lonestar"
license=("AGPL3")
depends=("bash")
makedepends=()
optdepends=()
provides=("lonestar")
conflicts=()
backup=("etc/lonestar/user.sh")
source=("$pkgname-$pkgver.tar.gz::https://github.com/tyil/lonestar/archive/v$pkgver.tar.gz")
sha512sums=("d1d8e30c20fc5ef1e669d05debcb9a07d09121ba1a858775701794d4cd01186ac1fdf40c90b81ae3de8a0d4ff7c221bd51103a72b98af19e6410e12eea0c9be4")

package() {
	cd -- "$pkgname-$pkgver" || exit 1
	make DESTDIR="$pkgdir/usr" ETCDIR="$pkgdir/etc" install

	# Add custom dist configuration
	cat > "$pkgdir/etc/lonestar/custom.sh" <<EOF
#! /usr/bin/env bash

# Application configuration
export LONESTAR_HELPPAGES="/usr/share/lonestar/help"
export LONESTAR_LIB="/usr/lib/lonestar"
EOF
}
