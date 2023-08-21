# Maintainer: AtticFinder65536 <atticfinder -AT- rocklabs -DOT- xyz>

pkgname=('discordchatexporter-cli')
pkgver=2.40.4
pkgrel=1
pkgdesc="Exports Discord chat logs to a file"
url="https://github.com/Tyrrrz/DiscordChatExporter"
license=('GPL3')
source=("${pkgname}-${pkgver}".tar.gz::https://github.com/Tyrrrz/DiscordChatExporter/archive/refs/tags/${pkgver}.tar.gz
	'discordchatexporter-cli')
b2sums=('946119b2de70768d87b6a65b56ec91921a5539dc87232ca01adcf7698f8be9c47b8ec7b45dd4a651d41fac73953f1a508c235a2c44520042dba9316327f7d168'
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
