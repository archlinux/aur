# Maintainer: Shahriyar Alam <mdshahriyaralam552@gmail.com>
#
# Generated from packaging/PKGBUILD.in by .github/workflows/release.yml.
# Edit the template, not the copy in the AUR repository.

pkgname=maono
pkgver=0.5.0
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
sha256sums=("5d936c1c6e4db66871f961c4c2992e46f11eccfdfa315da053961a9b0d9f0479"
            "4268d08d81256cf62ddbc09f71a02f4087f0a7f4c1555b6a1f8d00006872f15d"
            "caa1d5fd4ba176776d442004936bfa52598b9528a9ef9fcb52b92526b5b5f955"
            "4dc20b590bd28af00a5ac45ea625f12a2bd317dbb0ce620a42daa722ecfea578"
            "b2008dac59f44b7fd0563ddb38f21a69b0e97a4e033191a984eef1688ee3c0a7")

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
