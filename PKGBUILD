# Maintainer: AtticFinder65536 <atticfinder -AT- rocklabs -DOT- xyz>
# Contributor: JianQing Liu <me at pegasis dot site>

# stable release

pkgname="discord-chat-exporter-cli"
_apkgname="DiscordChatExporter"
pkgver=2.42.3
pkgrel=2

pkgdesc="Exports Discord chat logs to a file"
url="https://github.com/Tyrrrz/$_apkgname"
license=(GPL3)
arch=(any)

source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
  "$pkgname"
)
b2sums=(
  36d031776bece2c9d72cd7d64c955158464faca3fac2b5dd422bbcec7c6f34b6da4cf3cf8fa8ce7cfbbf1880c7df68204e42f5eed52479860eff016ae3107e16
  7540fb95f81c1041c87778c590a9438ffb64bf417c3d4d3f1363da5a25898c98f9dcd1209b9237bd595374a33326b7f23043bd6156cc7e14f0bff230ee0f6de6
)

options=('!strip')

depends=('dotnet-runtime-7.0')
makedepends=('dotnet-sdk-7.0')

build() {
  cd "$_apkgname-$pkgver"
  dotnet publish "$_apkgname.Cli" --configuration "Release"
}

package() {
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  cd "$_apkgname-$pkgver/$_apkgname.Cli/bin/Release/net7.0/publish"
  find . -type f -exec install -Dm644 "{}" "$pkgdir/usr/lib/$pkgname/{}" \;
}
