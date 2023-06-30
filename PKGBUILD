# Maintainer: AtticFinder65536 <atticfinder -AT- rocklabs -DOT- xyz>

pkgname=('discordchatexporter-cli')
pkgver=2.40
pkgrel=1
pkgdesc="Exports Discord chat logs to a file"
url="https://github.com/Tyrrrz/DiscordChatExporter"
license=('GPL3')
source=("${pkgname}-${pkgver}".tar.gz::https://github.com/Tyrrrz/DiscordChatExporter/archive/refs/tags/${pkgver}.tar.gz
	'discordchatexporter-cli')
b2sums=('4082f4b039796ee446ff33866970913cf4cc63860b28b13cac1dd466ed425879c4f964019f65e6537c4c94be8ca50f5876f4e58fdca47f1d19f9887aed31fb0a'
	'763d7ac60315aa945557096ccaea9ded7050e75aa183860d6f5749bbcd3c2fe565aad9dec7e320673725a4213f00915c5f1c3ce1c48626fde612e765b7d1dd80')
arch=('any')
depends=('dotnet-runtime-7.0')
makedepends=('dotnet-sdk-7.0')
options=('!strip')

build(){
	cd DiscordChatExporter-"${pkgver}"
	dotnet publish 'DiscordChatExporter.Cli' --configuration 'Release'
}

package(){
	cd DiscordChatExporter-"${pkgver}"

	# Install launcher
	install -Dm755 "${srcdir}"/discordchatexporter-cli "${pkgdir}"/usr/bin/discordchatexporter-cli

	# Install application
	cd DiscordChatExporter.Cli/bin/Release/net7.0/publish
	find . -type f -exec install -Dm644 "{}" "${pkgdir}"/usr/lib/${pkgname}"/{}" \;
}
