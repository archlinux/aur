# Maintainer: cgar <notify-cgar -AT- outlook -DOT- com>

pkgname='discord-chat-exporter-plus-cli'
_apkgname='DiscordChatExporter'
_gpkgname='DiscordChatExporterPlus'
pkgver=2.43
pkgrel=1

pkgdesc='Exports Discord chat logs to a file (without the political bloat)'
url="https://github.com/nulldg/$_gpkgname"
license=(MIT)
arch=(any)
conflicts=('discord-chat-exporter-cli')

source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
  "$pkgname"
)
b2sums=(
  b7551db99c1ed2fdc5075c966a6daa59da3d60dfe1e51f3244a86e498ebfb52055d97a3bb6dfcb8bed9a628eec240e0399254f5373cc4507c90685715da5d229
  315f8043cd13d1b8173531db1be93a842a11d8b2a12defc6ed07701ae56871cff5c99ff69d7a757fa1ccc821ce2f2652a5e0ee1160bdca2b6cab75eaa4ef6e8e
)

options=('!strip')

depends=('dotnet-runtime-8.0')
makedepends=('dotnet-sdk-8.0')

build() {
  cd "$_gpkgname-$pkgver"
  dotnet publish "$_apkgname.Cli" --configuration "Release"
}

package() {
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"

  cd "$_gpkgname-$pkgver"
  install -Dm644 License.txt "$pkgdir/usr/share/licenses/$pkgname/License.txt"

  cd "$_apkgname.Cli/bin/Release/net8.0/publish"
  find . -type f -exec install -Dm644 "{}" "$pkgdir/usr/lib/$pkgname/{}" \;
}
