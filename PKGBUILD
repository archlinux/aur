# Maintainer: Mylloon <aur@mylloon.fr>

# shellcheck disable=SC2034,SC2148,SC2154

pkgname='clownfish'
pkgver=0.1
pkgrel=1
pkgdesc="Clownfish Voice Changer"
arch=('x86_64')
url=https://clownfish-translator.com/voicechanger/
license=('Clownfish''s License')
provides=("$pkgname")
conflicts=("$pkgname")
source_x86_64=(
  "$pkgname-$pkgver.zip::https://clownfish-translator.com/voicechanger/download/ClownfishConsole/linux64/ClownfishConsole(v${pkgver}z).zip"
  "pipewire.conf"
)
sha256sums_x86_64=("SKIP" "SKIP")

package() {
  install -d "$pkgdir/usr/bin"
  cp "$srcdir/ClownfishConsole" "$pkgdir/usr/bin/$pkgname"
  install -Dm755 "$srcdir/ClownfishConsole" "$pkgdir/usr/bin/$pkgname"

  # Optional pipewire nodes
  if [[ -d /etc/pipewire ]]; then
    loc="usr/share/pipewire/pipewire.conf.d/clownfish.conf"
    install -Dm644 "pipewire.conf" "$pkgdir/$loc"

    echo "Optional PipeWire configuration installed to /$loc"
    echo "To apply it, restart PipeWire"
  fi
}
