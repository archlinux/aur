# Maintainer: AtticFinder65536 <atticventilation-aur at protonmail dot com>

pkgname=('discordchatexporter-cli')
_gitname=('DiscordChatExporter')
pkgver=2.34
pkgrel=1
pkgdesc="Exports Discord chat logs to a file"
url="https://github.com/Tyrrrz/DiscordChatExporter"
license=('GPL')
source=('git+https://github.com/Tyrrrz/DiscordChatExporter.git'
	'discordchatexporter-cli')
b2sums=('SKIP'
	'763d7ac60315aa945557096ccaea9ded7050e75aa183860d6f5749bbcd3c2fe565aad9dec7e320673725a4213f00915c5f1c3ce1c48626fde612e765b7d1dd80')
arch=('any')
depends=('dotnet-runtime-6.0')
makedepends=('git' 'dotnet-sdk-6.0')
options=('!strip')

build(){
	cd "${_gitname}"
	dotnet publish 'DiscordChatExporter.Cli' --configuration 'Release'
}

package(){
	cd "${_gitname}"

	# Install launcher
	install -Dm755 "${srcdir}"/discordchatexporter-cli "${pkgdir}"/usr/bin/discordchatexporter-cli

	# Install license
	install -Dm644 License.txt "${pkgdir}"/usr/share/licenses/"${pkgname}"/License.txt

	# Install application
	cd DiscordChatExporter.Cli/bin/Release/net6.0/publish
	find . -type f -exec install -Dm644 "{}" "${pkgdir}"/usr/lib/${pkgname}"/{}" \;
}
