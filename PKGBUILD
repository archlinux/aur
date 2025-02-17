# Contributor: LinuxAcme <lyp@linuxacme.com>
_pkgname=typora
pkgname="$_pkgname-free-cn"
pkgver=0.11.18
pkgrel=2
pkgdesc="typora历史旧版本，中国下载地址构建。"
arch=('x86_64')
filename="Typora_Linux_${pkgver}_amd64.deb"
license=('custom:"Copyright (c) 2015 Abner Lee All Rights Reserved."')
url="https://www.typora.io/"
depends=('gtk3' 'libxss')
optdepends=(
	'noto-fonts-emoji: Or some other emoji font to see emojis'
	'pandoc: Import/export for extra file formats')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("https://repo.linuxacme.com/$filename")
sha512sums=('8933cb4eab13a37719a3771d14a7a3f5951f6bbce06381ffe37ad5bc3029efed3878723427a4e97b83dbc1d7ccc43b31551b0c336663c843f0e685f8a4e2390e')

package() {
	bsdtar -xf data.tar.xz -C "$pkgdir/"
	rm -rf "$pkgdir/usr/share/lintian/"
	chmod 4755 "$pkgdir/usr/share/typora/chrome-sandbox"
	# Remove write permission for group/other
	chmod -R go-w "$pkgdir/usr/share/typora/resources/node_modules"
	sed -i '/Change Log/d' "$pkgdir/usr/share/applications/typora.desktop"
	find "$pkgdir" -type d -exec chmod 755 {} \;
}
