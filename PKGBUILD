# Maintainer: Alan Beale <the.mrabz@gmail.com>

pkgname=minecraft-bedrock-server
pkgver=1.19.51.01
pkgrel=1
pkgdesc="Minecraft Bedrock Server for Windows 10 and Xbox One versions of Minecraft"
arch=('x86_64')
url="https://www.minecraft.net/en-us/download/server/bedrock"
license=('custom')
noextract=('bedrock-server-${pkgver}.zip')
backup=(opt/minecraft-bedrock-server/{server.properties,permissions.json,whitelist.json,allowlist.json})
makedepends=('unzip')
source=("https://minecraft.azureedge.net/bin-linux/bedrock-server-${pkgver}.zip"
        'minecraft-bedrock-server.service'
	'minecraft-bedrock-server.sysusers'
	'minecraft-bedrock-server.tmpfiles')

sha256sums=('6734a53d833c3a7d314ec89f4200b8184d788349410c022662d606337fc1619d'
            'cc08effe04701f1ca16a1edd153d12a94ed498e9a3e68a004b74189eef9edb81'
            'a7070301958b58f804bb8dee8b66ef23ad7460403f7ba2cfffb549e29ad834d5'
            '829ff9e583408fcc1d0436a6896ecbd3128f893dcbc2b0147130219a13586ae3')

build() {
	unzip -q bedrock-server-${pkgver}.zip -d tmp
	rm bedrock-server-${pkgver}.zip
}

package() {
	install -d "$pkgdir"/opt/minecraft-bedrock-server
	cp -r -fHip "$srcdir"/tmp/* "$pkgdir"/opt/minecraft-bedrock-server
	install -Dm 644 minecraft-bedrock-server.service -t "$pkgdir"/usr/lib/systemd/system/
	install -Dm 644 minecraft-bedrock-server.sysusers "$pkgdir"/usr/lib/sysusers.d/minecraft-bedrock-server.conf
	install -Dm 644 minecraft-bedrock-server.tmpfiles "$pkgdir"/usr/lib/tmpfiles.d/minecraft-bedrock-server.conf
}
