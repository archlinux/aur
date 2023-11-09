# Maintainer: AtticFinder65536 <atticfinder -AT- rocklabs -DOT- xyz>

# stable release

pkgname="discordchatexporter-cli"
_apkgname="DiscordChatExporter"
pkgver=2.42.3
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
  36d031776bece2c9d72cd7d64c955158464faca3fac2b5dd422bbcec7c6f34b6da4cf3cf8fa8ce7cfbbf1880c7df68204e42f5eed52479860eff016ae3107e16
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
