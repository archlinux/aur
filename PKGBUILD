# Maintainer: Michael Straube <m.s.online gmx.de>
pkgname=fluxbox-style-debian-dark
pkgver=1.3.5
pkgrel=1
pkgdesc="Fluxbox style from debian"
url="https://packages.debian.org/jessie/fluxbox"
license=('custom:Expat')
arch=('any')
source=("http://http.debian.net/debian/pool/main/f/fluxbox/fluxbox_$pkgver-2.debian.tar.xz")
sha256sums=('0c3d66e6585d6f46f1f569b514a0e39e551d8598ba52b1b13325690b9aa25fef')

package() {
  install -Dm644 "$srcdir/debian/additional-themes/Debian/debian-dark" \
    "$pkgdir/usr/share/fluxbox/styles/debian-dark"

  install -Dm644 "$srcdir/debian/additional-themes/Images/Debian/debian-dark.png" \
    "$pkgdir/usr/share/backgrounds/fluxbox/debian-dark.png"

  # change wallpaper path in the style file
  sed -i 's#share/images#share/backgrounds#' "$pkgdir/usr/share/fluxbox/styles/debian-dark"

  # extract the license from copyright file
  sed -n '12,15p' "$srcdir/debian/copyright" > "$srcdir/LICENSE"
  sed -n '40,58p' "$srcdir/debian/copyright" >> "$srcdir/LICENSE"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
