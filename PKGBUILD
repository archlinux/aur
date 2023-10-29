# Maintainer: AtticFinder65536 <atticfinder -AT- rocklabs -DOT- xyz>

# stable release

pkgname="discordchatexporter-cli"
_apkgname="DiscordChatExporter"
pkgver=2.42.2
pkgrel=1

pkgdesc="Exports Discord chat logs to a file"
url="https://github.com/Tyrrrz/DiscordChatExporter"
license=(GPL3)
arch=(any)

source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
  "discordchatexporter-cli"
)
b2sums=(
  f4f6b6ab831b1dc1312269441c02a47d0fbb82781681cb707b24e8f3710ede845b6396c4f24b5c24db9d562f850b397c427ed196cd7ac9fb4a4c3a95d229c769
  763d7ac60315aa945557096ccaea9ded7050e75aa183860d6f5749bbcd3c2fe565aad9dec7e320673725a4213f00915c5f1c3ce1c48626fde612e765b7d1dd80
)

options=('!strip')

depends=('dotnet-runtime-7.0')
makedepends=('dotnet-sdk-7.0')

build() {
  cd "$_apkgname-$pkgver"
  dotnet publish "$_apkgname.Cli" --configuration "Release"
}

package() {
  cd "$_apkgname-$pkgver"

  install -Dm755 "${srcdir}"/discordchatexporter-cli "${pkgdir}"/usr/bin/discordchatexporter-cli

  cd "$_apkgname.Cli/bin/Release/net7.0/publish"
  find . -type f -exec install -Dm644 "{}" "${pkgdir}"/usr/lib/${pkgname}"/{}" \;
}
