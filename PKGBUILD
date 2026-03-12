# Maintainer: Muhammadamin <sizning@emailingiz.com>
pkgname=namoz-vaqtlari
pkgver=1.0.0
pkgrel=1
pkgdesc="Namoz vaqtlari CLI vositasi - Islom.uz ma'lumotlari va sahifalangan hududlar ro'yxati"
arch=('x86_64')
url="local-build"
license=('MIT')
depends=('dotnet-runtime-8.0')
makedepends=('dotnet-sdk-8.0')
# Mahalliy fayllardan foydalanish uchun source qismini bo'sh qoldiramiz yoki nuqta qo'yamiz
source=("${pkgname}::git+https://github.com/OneWay2Go/PrayerTimesFromMuslim.Uz.git")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}"
  dotnet publish -c Release -r linux-x64 --self-contained false -o out
}

package() {
  install -Dm755 "${srcdir}/${pkgname}/out/namoz-vaqtlari" "$pkgdir/usr/bin/namoz-vaqtlari"
  install -Dm644 "${srcdir}/${pkgname}/regions.json" "$pkgdir/usr/share/namoz-vaqtlari/regions.json"
}
