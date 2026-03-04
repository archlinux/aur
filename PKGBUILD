# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>

pkgname=continuwuity-bin
_name=${pkgname%-bin}
pkgver=0.5.6
pkgrel=1
pkgdesc='Community driven continuation of conduwuit & Conduit, focusing on user experience and new features'
arch=(x86_64 aarch64)
url="https://forgejo.ellis.link/continuwuation/$_name"
license=(Apache-2.0)
depends=(glibc libgcc libstdc++ liburing)
provides=(conduwuit $_name)
conflicts=(conduwuit $_name)
backup=(etc/conduwuit/conduwuit.toml)
options=(!debug)
source_x86_64=("$_name-$pkgver-x86_64::$url/releases/download/v$pkgver/conduwuit-linux-amd64")
source_aarch64=("$_name-$pkgver-aarch64::$url/releases/download/v$pkgver/conduwuit-linux-arm64")
source=("$_name-LICENSE-${license[0]}::$url/raw/tag/v$pkgver/LICENSE"
        "$_name-$pkgver-CHANGELOG.md::$url/raw/tag/v$pkgver/CHANGELOG.md"
        "$_name-$pkgver-conduwuit.service::$url/raw/tag/v$pkgver/pkg/conduwuit.service"
        "$_name-$pkgver-conduwuit-example.toml::$url/raw/tag/v$pkgver/conduwuit-example.toml")
b2sums=('05c474bd372cbb4f52a93982812b2ff8d6a38df6168ad673c8c2a7662ae5a23932b666c0997efec85c13b8a622f2ea4817bc7dc1560f9ed48ff914403595cba7'
        '22545cc3d56cc4c0c29a69cf198db0a4cc010c92ff9a96b76f886b967a7c417d067b60c1786d1e94c9b89dc98ebd2818773e84ef9b341a41fe81338a3a6db911'
        'da2f5e3778d8c62023d694969b37ecfed754ad2d8dc43c7cba44218618bbb95bade515537b41d22cb3222adeec4ef9074c5e8fc3f101c364751f2f4868dba96f'
        'b873c2825f8b405ab7bf97d69e1f8fa71abecf355ed07886f20dbd9b79f35cdcc947f599f1f04455bffc15119a11ab939d854abea8343843761bbc79905e62a3')
b2sums_x86_64=('10df1c2c9e473becc7627e151f4e76e4f087d87dfb69149ab1a846baa5ab3dfdcf32df1be21a31c149f86737e13f3f4c9151f3195d7882f899472d2bdbf459de')
b2sums_aarch64=('f097a1fccd57d3232674065c9c2abc1e0300cd0c4751ab515ede6f930c65e4a5197e715adc74dfe8f731663082a6355cfb0f44cb6a85fae3e47ea22c6f10ecb0')

package() {
    install -Dm755 $_name-$pkgver-$CARCH "$pkgdir/usr/bin/conduwuit"
    install -Dm644 $_name-LICENSE-${license[0]} "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 $_name-$pkgver-CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
    install -Dm644 $_name-$pkgver-conduwuit.service "$pkgdir/usr/lib/systemd/system/$_name.service"
    install -Dm600 $_name-$pkgver-conduwuit-example.toml "$pkgdir/etc/conduwuit/conduwuit.toml"
}
