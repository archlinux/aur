# Maintainer: Henri Koski <henri.koski@bitbrewers.fi>
pkgname=hcibridge-bin
pkgver=1.0.4
pkgrel=1
pkgdesc="Attach remote ESP32 Bluetooth bridges to the local Bluetooth stack (release binary)"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/heppu/hcibridge"
license=('MIT')
depends=('bluez')
provides=('hcibridge')
conflicts=('hcibridge')
backup=('etc/hcibridge/hcibridge.conf' 'etc/hcibridge/hcibridge.conf.d/50-example.conf' 'etc/default/hcibridge')
_rel="https://github.com/heppu/hcibridge/releases/download/v$pkgver"
source=("hcibridge-$pkgver.tar.gz::https://github.com/heppu/hcibridge/archive/refs/tags/v$pkgver.tar.gz"
        "hcibridge.1-$pkgver::$_rel/hcibridge.1"
        "hcibridge.bash-$pkgver::$_rel/hcibridge.bash"
        "_hcibridge-$pkgver::$_rel/_hcibridge"
        "hcibridge.fish-$pkgver::$_rel/hcibridge.fish")
source_x86_64=("hcibridge-$pkgver-x86_64::$_rel/hcibridge-x86_64-linux")
source_aarch64=("hcibridge-$pkgver-aarch64::$_rel/hcibridge-aarch64-linux")
source_armv7h=("hcibridge-$pkgver-armv7h::$_rel/hcibridge-armv7-linux")
sha256sums=('c3a36a08b2812a6cb0b0853a20a09d07ee32e8b1f715c06e518258d49393917c' '144fb641f281f75e42a8469b2a6b2ad65996592b5b2434836506be217fd614de' '7de3988de9a4985767be7b5c362dc395570321e6e628f319b3ef31c3c65716fd' 'fc0b041b0f0024bdec961222b4cd903142529d1a677e594b8e775c666924d24b' '0080e6f195bf0d1da41cebcc18c554580f4f0f038d40c757ce4f58a0bba9e53d')
sha256sums_x86_64=('4a41d90bc6c2a5bbe4d23195e63894727666e0172e5167330f76e128696f73ef')
sha256sums_aarch64=('de16cd6689a1228a9f855ac0509e9051cf877b354fe8e062ee56f4be2dec6345')
sha256sums_armv7h=('493dbb61c651c698a4b69817ccc826db87d5db1835faeb2cb7547a211fe0a0be')

package() {
    local src="hcibridge-$pkgver"
    install -Dm755 "hcibridge-$pkgver-$CARCH" "$pkgdir/usr/bin/hcibridge"
    install -Dm644 "hcibridge.1-$pkgver" "$pkgdir/usr/share/man/man1/hcibridge.1"
    install -Dm644 "hcibridge.bash-$pkgver" "$pkgdir/usr/share/bash-completion/completions/hcibridge"
    install -Dm644 "_hcibridge-$pkgver" "$pkgdir/usr/share/zsh/site-functions/_hcibridge"
    install -Dm644 "hcibridge.fish-$pkgver" "$pkgdir/usr/share/fish/vendor_completions.d/hcibridge.fish"
    install -Dm644 "$src/host/systemd/hcibridge.service" "$pkgdir/usr/lib/systemd/system/hcibridge.service"
    install -Dm644 "$src/host/systemd/hcibridge.env" "$pkgdir/etc/default/hcibridge"
    install -Dm644 "$src/host/modules-load.conf" "$pkgdir/usr/lib/modules-load.d/hci_vhci.conf"
    install -Dm644 "$src/host/config/hcibridge.conf" "$pkgdir/etc/hcibridge/hcibridge.conf"
    install -Dm644 "$src/host/config/hcibridge.conf.d/50-example.conf" "$pkgdir/etc/hcibridge/hcibridge.conf.d/50-example.conf"
    install -Dm644 "$src/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
