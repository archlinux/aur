# Maintainer: AtticFinder65536 <atticfinder -AT- rocklabs -DOT- xyz>
# Contributor: JianQing Liu <me at pegasis dot site>

# stable release

pkgname="discord-chat-exporter-cli"
_apkgname="DiscordChatExporter"
pkgver=2.42.6
pkgrel=1

pkgdesc="Exports Discord chat logs to a file"
url="https://github.com/Tyrrrz/$_apkgname"
license=(GPL3)
arch=(any)

source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
  "$pkgname"
)
b2sums=(
  60f55db525fda28745322e4923e811e1423a1731a7eb71a1eaab79b47f0ba7f9940914c7fbe543e37e830c5926df0b470deb3718315cc9defbdd814945a1db32
  7540fb95f81c1041c87778c590a9438ffb64bf417c3d4d3f1363da5a25898c98f9dcd1209b9237bd595374a33326b7f23043bd6156cc7e14f0bff230ee0f6de6
)

options=('!strip')

depends=('dotnet-runtime-8.0')
makedepends=('dotnet-sdk-8.0')

build() {
  cd "$_apkgname-$pkgver"
  dotnet publish "$_apkgname.Cli" --configuration "Release"
}

package() {
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  cd "$_apkgname-$pkgver/$_apkgname.Cli/bin/Release/net8.0/publish"
  find . -type f -exec install -Dm644 "{}" "$pkgdir/usr/lib/$pkgname/{}" \;
}
