# Maintainer: Leandro Guedes <leanguedes at icloud dot com>

pkgname=n-m3u8dl-re
pkgver=0.6.0beta
pkgrel=1
pkgdesc="Cross-Platform, modern and powerful stream downloader for MPD/M3U8/ISM"
arch=('x86_64')
url="https://github.com/nilaoda/N_m3u8DL-RE"
license=('MIT')
depends=(glibc)
makedepends=(dotnet-sdk git)
options=(!debug)
source=("${pkgname}-${pkgver}::git+https://github.com/nilaoda/N_m3u8DL-RE.git#tag=v${pkgver/[a-z]/-&}")
sha256sums=('762f6c417084c5b9e5c184c54e83f92ac3c230893ef8858c32d2f50e56540673')

build() {
	cd "$pkgname-$pkgver"
  dotnet publish src/N_m3u8DL-RE -c Release --os linux -o build
}

package() {
	cd "$pkgname-$pkgver"
  install -Dm775 build/N_m3u8DL-RE "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
