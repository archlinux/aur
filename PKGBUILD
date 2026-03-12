# Maintainer: uchqunov <2xotin123456@gmail.com>
pkgname=namoz-vaqtlari
pkgver=1.0.3
pkgrel=1
pkgdesc="Islom.uz ma'lumotlari asosida namoz vaqtlari CLI vositasi"
arch=('x86_64')
url="https://github.com/OneWay2Go/NamozVaqtlariCLI"
license=('MIT')
depends=('dotnet-runtime-8.0' 'chromium')
makedepends=('dotnet-sdk-8.0')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP') # Keyinchalik haqiqiy hashni qo'yamiz

build() {
  cd "NamozVaqtlariCLI-$pkgver"
  dotnet publish -c Release -r linux-x64 --self-contained false
}

package() {
  cd "NamozVaqtlariCLI-$pkgver"

  # Binarlarni o'rnatish
  install -Dm755 "bin/Release/net8.0/linux-x64/publish/NamozTaqvimCli" "$pkgdir/usr/bin/namoz"

  # regions.json ni o'rnatish
  install -Dm644 "bin/Release/net8.0/linux-x64/publish/regions.json" "$pkgdir/usr/bin/regions.json"
}
