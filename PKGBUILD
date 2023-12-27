# Maintainer: Jonas Bögle <aur@iwr.sh>
# Contributor: Jonathan Duck <duckbrain30@gmail.com>

# Consider using https://aur.archlinux.org/packages/typora instead

_pkgname=typora
pkgname="$_pkgname-free-bin"
pkgver=0.11.18
pkgrel=4
pkgdesc="A minimal markdown editor and reader(free version)."
arch=('x86_64' 'aarch64')
license=('custom:"Copyright (c) 2015 Abner Lee All Rights Reserved."')
url="https://typora.io/"
depends=('gtk3' 'libxss')
optdepends=(
	'noto-fonts-emoji: Or some other emoji font to see emojis'
	'pandoc: Import/export for extra file formats')
provides=("$_pkgname")
conflicts=("$_pkgname")
# The original URL is not available anymore
source_x86_64=("https://github.com/wyf9661/typora-free/releases/download/v0.11.18/typora_0.11.18_amd64.deb")
source_aarch64=("https://github.com/wyf9661/typora-free/releases/download/v0.11.18/typora_0.11.18_arm64.deb")
sha512sums_x86_64=('8933cb4eab13a37719a3771d14a7a3f5951f6bbce06381ffe37ad5bc3029efed3878723427a4e97b83dbc1d7ccc43b31551b0c336663c843f0e685f8a4e2390e')
sha512sums_aarch64=('046b683d8a6039fe8c08d2f462b6caf9a3bf07b4204e001ac2be438a64ba1ac8ed05a02e6032f0d2b2bd702b24fc0678a41da2c229cfb8297c0e7f8cf07b9c07')

package() {
	bsdtar -xf data.tar.xz -C "$pkgdir/"
	rm -rf "$pkgdir/usr/share/lintian/"
	chmod 4755 "$pkgdir/usr/share/typora/chrome-sandbox"
	# Remove write permission for group/other
	chmod -R go-w "$pkgdir/usr/share/typora/resources/node_modules"
	sed -i '/Change Log/d' "$pkgdir/usr/share/applications/typora.desktop"
	find "$pkgdir" -type d -exec chmod 755 {} \;
}
