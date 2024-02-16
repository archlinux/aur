# Maintainer: cgar <notify-cgar -AT- outlook -DOT- com>

pkgname='discord-chat-exporter-plus-cli'
_apkgname='DiscordChatExporter'
_gpkgname='DiscordChatExporterPlus'
pkgver=2.42.7
pkgrel=2

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
  d0b770dbd7b1d434642370ec748009cd0c2046c71e3b6ad41184bdafab099b035c7294161a6ff7728856081c1fa14e15bf76bb2154b8f17e9464d6315826cf17
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
