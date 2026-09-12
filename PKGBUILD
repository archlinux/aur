# Maintainer: Shahriyar Alam <mdshahriyaralam552@gmail.com>
#
# Generated from packaging/PKGBUILD.in by .github/workflows/release.yml.
# Edit the template, not the copy in the AUR repository.

pkgname=maono
pkgver=0.6.0
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
sha256sums=("ce305400fc561b1cb962e4324ef328bc007463b7f788f48b03209d89157e8000"
            "4268d08d81256cf62ddbc09f71a02f4087f0a7f4c1555b6a1f8d00006872f15d"
            "caa1d5fd4ba176776d442004936bfa52598b9528a9ef9fcb52b92526b5b5f955"
            "86f5df8210196e37d62e8e02d2a87ac5af98366835b98ba922ae0a9d1435bf84"
            "ac1c192d4d39ea6922d3f4bf7b1709693ce8801c03638fa798d0fae408af032e")

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
