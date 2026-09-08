# Maintainer: Henri Koski <henri.koski@bitbrewers.fi>
pkgname=hcibridge-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="Attach remote ESP32 Bluetooth bridges to the local Bluetooth stack (release binary)"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/heppu/hcibridge"
license=('MIT')
depends=('bluez')
provides=('hcibridge')
conflicts=('hcibridge')
backup=('etc/hcibridge/config' 'etc/hcibridge/config.d/50-example.conf' 'etc/default/hcibridge')
_rel="https://github.com/heppu/hcibridge/releases/download/v$pkgver"
source=("hcibridge-$pkgver.tar.gz::https://github.com/heppu/hcibridge/archive/refs/tags/v$pkgver.tar.gz"
        "hcibridge.1-$pkgver::$_rel/hcibridge.1"
        "hcibridge.bash-$pkgver::$_rel/hcibridge.bash"
        "_hcibridge-$pkgver::$_rel/_hcibridge"
        "hcibridge.fish-$pkgver::$_rel/hcibridge.fish")
source_x86_64=("hcibridge-$pkgver-x86_64::$_rel/hcibridge-x86_64-linux")
source_aarch64=("hcibridge-$pkgver-aarch64::$_rel/hcibridge-aarch64-linux")
source_armv7h=("hcibridge-$pkgver-armv7h::$_rel/hcibridge-armv7-linux")
sha256sums=('257c1d366bbc7060ffd865d390ec6346a4fbade0fcac61c331ef7c47c76650cf' 'c8b0371269083e8d3262470333b24ef10daeec9fdae0fa0b08e46449998f2e65' '7de3988de9a4985767be7b5c362dc395570321e6e628f319b3ef31c3c65716fd' '5303882f927736c07944c53d25e52d00f957461fe597f0d5feb87378a3c3f0a5' '6ead0d149c08e820c1e37ce2207eca4aba9d5e7aae600f9caafde94f8f94e75b')
sha256sums_x86_64=('0e63c00ea28ff8227c57dcd60c7d312671a464f6b23d607b58646bf07a2ac98d')
sha256sums_aarch64=('41411a8f82e098e7ffc3e66e804ad4c91306a9a7fabd44e2e8dbb120f85a633f')
sha256sums_armv7h=('3363f635aeeb9b8b24968eb0fe385c11362ff3129ae64d8dc831947617ca4671')

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
    install -Dm644 "$src/host/config/config" "$pkgdir/etc/hcibridge/config"
    install -Dm644 "$src/host/config/config.d/50-example.conf" "$pkgdir/etc/hcibridge/config.d/50-example.conf"
    install -Dm644 "$src/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
