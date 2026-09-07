# Maintainer: Henri Koski <henri.koski@bitbrewers.fi>
pkgname=hcibridge-bin
pkgver=0.10.20
pkgrel=1
pkgdesc="Attach remote ESP32 Bluetooth bridges to the local Bluetooth stack (release binary)"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/heppu/esp-hci-bridge"
license=('MIT')
depends=('bluez')
provides=('hcibridge')
conflicts=('hcibridge')
backup=('etc/hcibridge/config' 'etc/hcibridge/config.d/50-example.conf' 'etc/default/hcibridge')
_rel="https://github.com/heppu/esp-hci-bridge/releases/download/v$pkgver"
source=("hcibridge-$pkgver.tar.gz::https://github.com/heppu/esp-hci-bridge/archive/refs/tags/v$pkgver.tar.gz"
        "hcibridge.1-$pkgver::$_rel/hcibridge.1"
        "hcibridge.bash-$pkgver::$_rel/hcibridge.bash"
        "_hcibridge-$pkgver::$_rel/_hcibridge"
        "hcibridge.fish-$pkgver::$_rel/hcibridge.fish")
source_x86_64=("hcibridge-$pkgver-x86_64::$_rel/hcibridge-x86_64-linux")
source_aarch64=("hcibridge-$pkgver-aarch64::$_rel/hcibridge-aarch64-linux")
source_armv7h=("hcibridge-$pkgver-armv7h::$_rel/hcibridge-armv7-linux")
sha256sums=('414411092843d85394d3068cebc08d6ed955870ad853ccb93648523175c6dbba' 'cb0a9f8e1071aedc20806c658efce9afd7430f9bd7064a2dcd9d782d19e6edbd' '7de3988de9a4985767be7b5c362dc395570321e6e628f319b3ef31c3c65716fd' '5303882f927736c07944c53d25e52d00f957461fe597f0d5feb87378a3c3f0a5' '6ead0d149c08e820c1e37ce2207eca4aba9d5e7aae600f9caafde94f8f94e75b')
sha256sums_x86_64=('956e2761fc76dcdeb2dafdb918360dbe449ad0c7841a3bccc138a8e537ab6e5d')
sha256sums_aarch64=('a01049402c16c4710f974a0438764140c24fb3ef33ffe86bb6ace970413b37d9')
sha256sums_armv7h=('c10b1a84f7deba5c17c15e7c403df2023d88eee1d4621f840593b0185541820d')

package() {
    local src="esp-hci-bridge-$pkgver"
    install -Dm755 "hcibridge-$pkgver-$CARCH" "$pkgdir/usr/bin/hcibridge"
    install -Dm644 "hcibridge.1-$pkgver" "$pkgdir/usr/share/man/man1/hcibridge.1"
    install -Dm644 "hcibridge.bash-$pkgver" "$pkgdir/usr/share/bash-completion/completions/hcibridge"
    install -Dm644 "_hcibridge-$pkgver" "$pkgdir/usr/share/zsh/site-functions/_hcibridge"
    install -Dm644 "hcibridge.fish-$pkgver" "$pkgdir/usr/share/fish/vendor_completions.d/hcibridge.fish"
    install -Dm644 "$src/host/systemd/hcibridge.service" "$pkgdir/usr/lib/systemd/system/hcibridge.service"
    install -Dm644 "$src/host/systemd/hcibridge.env" "$pkgdir/etc/default/hcibridge"
    install -Dm644 "$src/host/modules-load.conf" "$pkgdir/usr/lib/modules-load.d/hci_vhci.conf"
    install -Dm644 "$src/host/config/config" "$pkgdir/etc/hcibridge/config"
    install -Dm644 "$src/host/config/config.d/50-example.conf" "$pkgdir/etc/hcibridge/config.d/50-example.conf"
    install -Dm644 "$src/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
