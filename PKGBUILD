# Maintainer: Michael Straube <michael_straube web de>

pkgname=fluxbox-style-debian-dark
pkgver=1.3.5
_debpkgrel=2
pkgrel=1
pkgdesc="Fluxbox style from debian"
url="https://packages.debian.org/jessie/fluxbox"
license=('custom:Expat')
arch=('any')
source=("http://http.debian.net/debian/pool/main/f/fluxbox/fluxbox_$pkgver-$_debpkgrel.debian.tar.xz")
sha1sums=('7afa1a1e61566500b76aa89656bb9a92e3126eaf')

prepare() {
  # extract the license from copyright file
  sed -n '12,15p' debian/copyright > LICENSE
  sed -n '40,58p' debian/copyright >> LICENSE

  # change wallpaper path in the style file
  sed -i 's#share/images#share/backgrounds#' \
    debian/additional-themes/Debian/debian-dark
}

package() {
  install -Dm644 debian/additional-themes/Debian/debian-dark \
    "$pkgdir/usr/share/fluxbox/styles/debian-dark"

  install -Dm644 debian/additional-themes/Images/Debian/debian-dark.png \
    "$pkgdir/usr/share/backgrounds/fluxbox/debian-dark.png"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
