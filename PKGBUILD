# Maintainer: Jonas Costa <contact@jonascosta.ch>
pkgname=popstudio
pkgver=5.0
pkgrel=1
pkgdesc="Extracts and converts various file types found in PopCap games."
arch=("x86_64")
url="https://github.com/YingFengTingYu/PopStudio_Old"
license=('Apache-2.0')
provides=("popstudio")
depends=()
makedepends=('unzip')

source=("$pkgname-$pkgver.zip::https://github.com/YingFengTingYu/PopStudio_Old/archive/refs/tags/v5.0.tar.gz")
sha256sums=('01db73db3bd2bb170113c1250e4455129a97610538dacc7035507b536cdfbbd3')
noextract=("$pkgname-$pkgver.zip")

build() {
  cd "PopStudio_Old-$pkgver/PopStudio.ConsoleProject"

  export DOTNET_CLI_TELEMETRY_OPTOUT=1

  dotnet clean
  dotnet restore
  #dotnet nuget locals all -c

  dotnet publish -c Release -r linux-x64 --self-contained -o publish_console .
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  cp "$srcdir/PopStudio_Old-$pkgver/PopStudio.ConsoleProject/publish_console/PopStudio" "$pkgdir/usr/bin/popstudio"
  chmod +x "$pkgdir/usr/bin/popstudio"
}