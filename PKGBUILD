# Maintainer: HBBrennan <brennantracy4 at gmail dot com>
# Contributor: depsterr <depsterr at protonmail dot com>
pkgname=glasscord
pkgver=0.0.6
pkgrel=1
pkgdesc='Providing composition effects to the Discord client.'
arch=('any')
url='https://github.com/AryToNeX/Glasscord'
license=('Apache License 2.0')
groups=()
depends=('discord' 'xorg-xprop')
makedepends=('npm')
checkdepends=()
optdepends=('beautiful-discord: Adds CSS hot-reload to Discord.'
            'betterdiscord: Adds CSS hot-reload and more to Discord.'
			'betterdiscord-rauenzi-git: Adds CSS hot-reload and more to Discord.')
source=("https://github.com/AryToNeX/Glasscord/archive/v$pkgver.tar.gz")
md5sums=("f68649dcbb57829f1400bb85f03458fc")

build() {
	cd "$srcdir/Glasscord-$pkgver"
	npm install
}

package() {
	injdir=$(find ~/.config/discord -name "discord_desktop_core" -type d | sed '1q')
	install -m644 "$srcdir/Glasscord-$pkgver/$pkgname.asar" "$injdir"
	install -D -m644 "$srcdir/Glasscord-$pkgver/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -D -m644 "$srcdir/Glasscord-$pkgver/extras/glasscord_example.theme.css" "${pkgdir}/usr/share/${pkgname}/glasscord_example.theme.css"

	sed -i "/^require('\.\/glasscord\.asar')$/d" "$injdir/index.js"
    sed -i "1s/^/require('\.\/glasscord\.asar')\n/" "$injdir/index.js"
}

