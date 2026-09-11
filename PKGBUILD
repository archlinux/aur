# Maintainer: Shahriyar Alam <mdshahriyaralam552@gmail.com>
#
# Generated from packaging/PKGBUILD.in by .github/workflows/release.yml.
# Edit the template, not the copy in the AUR repository.

pkgname=maono
pkgver=0.2.0
pkgrel=1
pkgdesc="Maono PD100W wireless microphone controller (TUI + CLI)"
arch=("x86_64")
url="https://github.com/shahriyardx/maono"
license=("MIT")
depends=()
options=("!strip" "!debug")
source=("maono-$pkgver::$url/releases/download/v$pkgver/maono"
        "LICENSE-$pkgver::$url/raw/v$pkgver/LICENSE"
        "99-maono.rules-$pkgver::$url/raw/v$pkgver/99-maono.rules")
sha256sums=("1f342da609d1e73f1d9051a47dbb34463bd6efd0d67e0adea4ba838369bb456b"
            "4268d08d81256cf62ddbc09f71a02f4087f0a7f4c1555b6a1f8d00006872f15d"
            "afaf978a31f80f6797eea61fd8f3b031fe255590aaa448a8bbe3138c5e62d263")

package() {
  install -Dm755 "$srcdir/maono-$pkgver" "$pkgdir/usr/bin/maono"
  install -Dm644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # The receiver's hidraw node is root-only without this. udev picks it up from
  # here, but the receiver has to be replugged before the new mode applies.
  install -Dm644 "$srcdir/99-maono.rules-$pkgver" \
    "$pkgdir/usr/lib/udev/rules.d/99-maono.rules"
}
