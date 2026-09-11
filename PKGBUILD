# Maintainer: Shahriyar Alam <mdshahriyaralam552@gmail.com>
#
# Generated from packaging/PKGBUILD.in by .github/workflows/release.yml.
# Edit the template, not the copy in the AUR repository.

pkgname=maono
pkgver=0.4.0
pkgrel=1
pkgdesc="Maono PD100W wireless microphone controller (TUI + CLI)"
arch=("x86_64")
url="https://github.com/shahriyardx/maono"
license=("MIT")
depends=()
options=("!strip" "!debug")
source=("maono-$pkgver::$url/releases/download/v$pkgver/maono"
        "LICENSE-$pkgver::$url/raw/v$pkgver/LICENSE"
        "99-maono.rules-$pkgver::$url/raw/v$pkgver/99-maono.rules"
        "manifest.json-$pkgver::$url/raw/v$pkgver/shell/manifest.json"
        "Panel.qml-$pkgver::$url/raw/v$pkgver/shell/Panel.qml")
sha256sums=("c6fc23ae507f3cf9a1c00724f212973978211badf1009597705df1b79ab77628"
            "4268d08d81256cf62ddbc09f71a02f4087f0a7f4c1555b6a1f8d00006872f15d"
            "afaf978a31f80f6797eea61fd8f3b031fe255590aaa448a8bbe3138c5e62d263"
            "84e0184657d2e4a1b5e47a28089f0e1196c9d90938db25eaa253f0a8907c6a6d"
            "e5904319efd4ec52f9531a9ade7998758dab2f7f45a1e3c0a9a8a894c04dd64b")

package() {
  install -Dm755 "$srcdir/maono-$pkgver" "$pkgdir/usr/bin/maono"
  install -Dm644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # The receiver's hidraw node is root-only without this. udev picks it up from
  # here, but the receiver has to be replugged before the new mode applies.
  install -Dm644 "$srcdir/99-maono.rules-$pkgver" \
    "$pkgdir/usr/lib/udev/rules.d/99-maono.rules"

  # Omarchy shell bar widget. The shell only scans ~/.config/omarchy/plugins/,
  # so this is staged here and copied into place by `maono shell install`.
  install -Dm644 "$srcdir/manifest.json-$pkgver" "$pkgdir/usr/share/maono/shell/manifest.json"
  install -Dm644 "$srcdir/Panel.qml-$pkgver" "$pkgdir/usr/share/maono/shell/Panel.qml"
}
