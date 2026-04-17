# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>

pkgname=continuwuity-bin
_name=${pkgname%-bin}
pkgver=0.5.7
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
b2sums=('518d931ec3677f070b113790e4aa9ee45ed1e4b9db4b15c08ef72f62eb82f4778347a55fa7cd61cc1654c012cdc0b52f0cf5d05444b20c7e9a002f8d3088c276'
        '317f65d5dd667b966e2499b65a19864a9832966721b3565377e9a59116730f94075b94859be1bc06f50720c68780f3c93b61890580109c8106f49381a49fb2e4'
        '1a7146581c3cedef312287589c5189e02ef205e08e997af3604a472b2584466c693d52ca8cda254d2202d50bd46af65bda049b3b1f1fc00aaa074cbcb31e0e73'
        '1b78f489e1ce39911ded71367abb4de9bd5347aa69ecbd22179a15b1647ea5b74793acbff5aafa822617730bed8544f85de27beccc9e04baed7080490e098a06')
b2sums_x86_64=('6d6a2d6e7d1f7f559b4ac39f4c61be199160585855dd05585607477d0bfd0752d28cda0d8f20a831ea351ca295f44c86816c84dba135cf9e59bedec047d7c2ce')
b2sums_aarch64=('c5853f6e31a26953fffd05f794b4e3771953a9a942b9ccdc99a6eb84cbce40f495c4b226ab41901f82a0f2c96108b89399aa3268a1a23db1b5418de0c0da4c42')

package() {
    install -Dm755 $_name-$pkgver-$CARCH "$pkgdir/usr/bin/conduwuit"
    install -Dm644 $_name-LICENSE-${license[0]} "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 $_name-$pkgver-CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
    install -Dm644 $_name-$pkgver-conduwuit.service "$pkgdir/usr/lib/systemd/system/$_name.service"
    install -Dm600 $_name-$pkgver-conduwuit-example.toml "$pkgdir/etc/conduwuit/conduwuit.toml"
}
