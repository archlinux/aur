# Maintainer: Jonas Costa <contact@jonascosta.ch>
pkgname=popstudio
pkgver=6.1
pkgrel=1
pkgdesc="Extracts and converts various file types found in PopCap games."
arch=("x86_64")
url="https://github.com/PopGameTool/PopStudio"
license=('Apache-2.0')
provides=("popstudio")
depends=()
makedepends=('dotnet-sdk')

source=("$pkgname-$pkgver.zip::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9184ad30eaa93746b2efce69577743d1923d61681211dd90e69a754502f55346')

build() {
  cd "PopStudio-$pkgver/PopStudio.ConsoleProject"
  export DOTNET_CLI_TELEMETRY_OPTOUT=1
  dotnet publish -c Release -r linux-x64 -o publish_console --self-contained true
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/opt/$pkgname"
  cp "$srcdir/PopStudio-$pkgver/PopStudio.ConsoleProject/publish_console/"* "$pkgdir/opt/$pkgname/"
  ln -s "/opt/$pkgname/PopStudio" "$pkgdir/usr/bin/$pkgname"
}
