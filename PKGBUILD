# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>

pkgname=continuwuity-bin
_name=${pkgname%-bin}
pkgver=0.5.9
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
source_x86_64=($_name-$pkgver-x86_64::$url/releases/download/v$pkgver/conduwuit-linux-amd64)
source_aarch64=($_name-$pkgver-aarch64::$url/releases/download/v$pkgver/conduwuit-linux-arm64)
source=($_name-LICENSE-${license[0]}::$url/raw/tag/v$pkgver/LICENSE
        $_name-$pkgver-CHANGELOG.md::$url/raw/tag/v$pkgver/CHANGELOG.md
        $_name-$pkgver-conduwuit.service::$url/raw/tag/v$pkgver/pkg/conduwuit.service
        $_name-$pkgver-conduwuit-example.toml::$url/raw/tag/v$pkgver/conduwuit-example.toml)
b2sums=('518d931ec3677f070b113790e4aa9ee45ed1e4b9db4b15c08ef72f62eb82f4778347a55fa7cd61cc1654c012cdc0b52f0cf5d05444b20c7e9a002f8d3088c276'
        '0672a0bc4c89a3275f4c233aa1bf4bc70cf11821514c6d030a473c0ae4c04869a0863e0aafbc0d7c1505931eefdef2e1150353de02be2d36966acab6a0dbc116'
        '1a7146581c3cedef312287589c5189e02ef205e08e997af3604a472b2584466c693d52ca8cda254d2202d50bd46af65bda049b3b1f1fc00aaa074cbcb31e0e73'
        'fbf95745da2a10531ce3722cf5f85e8847f91803a864d47ef26456e803ec8802d069d2fbbc44ed94783d73e7d407ffb4e5be2092dfa100630a8fc91bd2a737b7')
b2sums_x86_64=('ae41dcb6b4076be5c8b2f172f906be08112df9afaae3f8b6cd80d87c6a74ea36d93c21ccaaf878ed9b3e22d1933b192a5d956455a71c7641a69c2ec2ea00e927')
b2sums_aarch64=('5449f2cf4ebbae151a7e123a42f9799d3ce509d4c8ed91f2d62ba2e9e3b914b87e24faeb1c2f3539bcba2be27a065e2822093f8f39333b0303f434c1ad6dc0a9')

package() {
    install -Dm755 $_name-$pkgver-$CARCH "$pkgdir/usr/bin/conduwuit"
    install -Dm644 $_name-LICENSE-${license[0]} "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 $_name-$pkgver-CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
    install -Dm644 $_name-$pkgver-conduwuit.service "$pkgdir/usr/lib/systemd/system/$_name.service"
    install -Dm600 $_name-$pkgver-conduwuit-example.toml "$pkgdir/etc/conduwuit/conduwuit.toml"
}
