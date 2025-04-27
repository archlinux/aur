# Maintainer: wyf9661 <wyf9661@hotmail.com>
# Contributor: Jonas Bögle <aur@iwr.sh>

# Consider https://github.com/hazukieq/Yporaject , which supports only <= 1.9.3

_pkgname=typora
pkgname="$_pkgname-free-bin"
pkgver=1.9.3
pkgrel=1
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
download_url=("https://download2.typoraio.cn/linux")
source_x86_64=("${download_url}/${_pkgname}_${pkgver}_amd64.deb")
source_aarch64=("${download_url}/${_pkgname}_${pkgver}_arm64.deb")
sha1sums_x86_64=('f4780590cf073c14f20e34393d52035a1c3b0da9')
sha1sums_aarch64=('3130eab4cc27cb0c0ab68ba757789b8a9bf4d271')

package() {
	bsdtar -xf data.tar.xz -C "$pkgdir/"
	rm -rf "$pkgdir/usr/share/lintian/"
	chmod 4755 "$pkgdir/usr/share/typora/chrome-sandbox"
	# Remove write permission for group/other
	chmod -R go-w "$pkgdir/usr/share/typora/resources/node_modules"
	sed -i '/Change Log/d' "$pkgdir/usr/share/applications/typora.desktop"
	find "$pkgdir" -type d -exec chmod 755 {} \;
}
