# Maintainer: uchqunov <2xotin123456@gmail.com>
pkgname=namoz-vaqtlari
pkgver=1.0.4
pkgrel=2  # Versiyani 2 ga ko'taramiz
pkgdesc="Islom.uz ma'lumotlari asosida namoz vaqtlari CLI vositasi"
arch=('x86_64')
url="https://github.com/OneWay2Go/NamozVaqtlariCLI"
license=('MIT')
depends=('dotnet-runtime-8.0' 'chromium')
makedepends=('dotnet-sdk-8.0')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "NamozVaqtlariCLI-$pkgver"
  # SingleFile ishlatmaymiz, oddiy publish qilamiz
  dotnet publish -c Release -r linux-x64 --self-contained false
}

package() {
  cd "NamozVaqtlariCLI-$pkgver"

  # 1. Barcha publish qilingan fayllar uchun papka yaratamiz
  install -d "$pkgdir/usr/lib/$pkgname"

  # 2. Hamma fayllarni (DLL, JSON va h.k.) o'sha papkaga ko'chiramiz
  cp -r bin/Release/net8.0/linux-x64/publish/* "$pkgdir/usr/lib/$pkgname/"

  # 3. /usr/bin ichida 'executable' (ishga tushiruvchi) skript yaratamiz
  install -d "$pkgdir/usr/bin"
  ln -s "/usr/lib/$pkgname/NamozVaqtlariCLI" "$pkgdir/usr/bin/namoz"
}
