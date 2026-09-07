# Maintainer: Henri Koski <henri.koski@bitbrewers.fi>
pkgname=hcibridge-bin
pkgver=0.10.16
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
sha256sums=('0669735eee5b9b750b9dfb5ce5f1aec0df582748021dc77511df372f44f62c7e' '691bebbc27cbe985fa5043472737eaa00923dd93c5ed3f486900c784bdb6b0f2' '7de3988de9a4985767be7b5c362dc395570321e6e628f319b3ef31c3c65716fd' '5303882f927736c07944c53d25e52d00f957461fe597f0d5feb87378a3c3f0a5' '6ead0d149c08e820c1e37ce2207eca4aba9d5e7aae600f9caafde94f8f94e75b')
sha256sums_x86_64=('4875367ff5e14225d35b341fc8eb0d194911ee5a53d0a6b9da2033787484d7a7')
sha256sums_aarch64=('5e7d6bf642370ac6006771000c25bbc3e0bb6eafede8c936d14e87381410b3d2')
sha256sums_armv7h=('a0f5ac55ea6c9625f253c6e23834a161d957ebe2650f81624a0ef78118d3f2b1')

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
