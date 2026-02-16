# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>

pkgname=continuwuity-bin
_name=${pkgname%-bin}
pkgver=0.5.5
pkgrel=1
pkgdesc='Community driven continuation of conduwuit & Conduit, focusing on user experience and new features'
arch=(x86_64 aarch64)
url="https://forgejo.ellis.link/continuwuation/$_name"
license=(Apache-2.0)
depends=(glibc libgcc_s.so libstdc++.so liburing.so)
provides=(conduwuit $_name)
conflicts=(conduwuit $_name)
backup=(etc/conduwuit/conduwuit.toml)
options=(!debug)
source_x86_64=("$_name-$pkgver-x86_64::$url/releases/download/v$pkgver/conduwuit-linux-amd64")
source_aarch64=("$_name-$pkgver-aarch64::$url/releases/download/v$pkgver/conduwuit-linux-arm64")
source=("$_name-LICENSE-${license[0]}::$url/raw/tag/v$pkgver/LICENSE"
        "$_name-$pkgver-conduwuit.service::$url/raw/tag/v$pkgver/pkg/conduwuit.service"
        "$_name-$pkgver-conduwuit-example.toml::$url/raw/tag/v$pkgver/conduwuit-example.toml")
b2sums=('05c474bd372cbb4f52a93982812b2ff8d6a38df6168ad673c8c2a7662ae5a23932b666c0997efec85c13b8a622f2ea4817bc7dc1560f9ed48ff914403595cba7'
        'da2f5e3778d8c62023d694969b37ecfed754ad2d8dc43c7cba44218618bbb95bade515537b41d22cb3222adeec4ef9074c5e8fc3f101c364751f2f4868dba96f'
        'd3efa1980f0d2edf26cfd86ee7e0bbf829b4a89e958676536aafb2e0207b4650d0c4796bdfa4c99f4ba72118cbfe408440400cc135a5c954ea5fa0a02c02cebd')
b2sums_x86_64=('a2c96960b083007cf8fd75ce4c80ac37a33e5d587296ba425dc698720ca92aea5858edd17ed103b6caf6918054aa1495a0b8f9f10e7f6c81e4ace66c52c8ad80')
b2sums_aarch64=('3d190539421dd931983096cd36757818a94ef82b7f24a121d612697fd9293fe943f692e177e195f3d98dab3feacfdd81180e971050affc8b295990f68b8b5b67')

package() {
    install -Dm755 $_name-$pkgver-$CARCH "$pkgdir/usr/bin/conduwuit"
    install -Dm644 $_name-LICENSE-${license[0]} "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 $_name-$pkgver-conduwuit.service "$pkgdir/usr/lib/systemd/system/$_name.service"
    install -Dm600 $_name-$pkgver-conduwuit-example.toml "$pkgdir/etc/conduwuit/conduwuit.toml"
}
