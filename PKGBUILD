# Maintainer: AtticFinder65536 <atticfinder -AT- rocklabs -DOT- xyz>

pkgname=('discordchatexporter-cli')
pkgver=2.35
pkgrel=1
pkgdesc="Exports Discord chat logs to a file"
url="https://github.com/Tyrrrz/DiscordChatExporter"
license=('GPL')
source=("${pkgname}-${pkgver}".tar.gz::https://github.com/Tyrrrz/DiscordChatExporter/archive/refs/tags/${pkgver}.tar.gz
	'discordchatexporter-cli')
b2sums=('4faaccbc738edec85dbac99543ea0aeefcc8038fb29894bdc2544c105030081ff40ab8a5405217e68a94ebc4ad3f2695a03647d727f8ed97016b76f615976947'
	'763d7ac60315aa945557096ccaea9ded7050e75aa183860d6f5749bbcd3c2fe565aad9dec7e320673725a4213f00915c5f1c3ce1c48626fde612e765b7d1dd80')
arch=('any')
depends=('dotnet-runtime-6.0')
makedepends=('dotnet-sdk-6.0')
options=('!strip')

build(){
	cd DiscordChatExporter-"${pkgver}"
	dotnet publish 'DiscordChatExporter.Cli' --configuration 'Release'
}

package(){
	cd DiscordChatExporter-"${pkgver}"

	# Install launcher
	install -Dm755 "${srcdir}"/discordchatexporter-cli "${pkgdir}"/usr/bin/discordchatexporter-cli

	# Install license
	install -Dm644 License.txt "${pkgdir}"/usr/share/licenses/"${pkgname}"/License.txt

	# Install application
	cd DiscordChatExporter.Cli/bin/Release/net6.0/publish
	find . -type f -exec install -Dm644 "{}" "${pkgdir}"/usr/lib/${pkgname}"/{}" \;
}
