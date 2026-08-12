# Maintainer: GGOBP <GGOBP at protonmail dot ch>

pkgname=mxpak-bin
pkgver=0.2.6
pkgrel=1
pkgdesc="Mendix widget .mpk package manager"
arch=('any')
url="https://github.com/glendix-labs/mxpak"
license=('MIT')
depends=('erlang-core' 'erlang-inets' 'erlang-ssl')
provides=("mxpak=$pkgver")
conflicts=('mxpak')
options=('!strip' '!debug')
source=(
  "mxp-$pkgver::$url/releases/download/v$pkgver/mxp"
  'LICENCE'
)
noextract=("mxp-$pkgver")
sha256sums=('0ca1dfac36f4c121f81597cbd61e4f9a2415e84b1f17cf933911c6d186ac398e' 'ca382295b2ca8d5f61f35f03a5274919dc3e84144325b5b9f0e0d16b274661b0')

check() {
  escript "$srcdir/mxp-$pkgver" --version |
    grep -Fxq "mxpak v$pkgver"
}

package() {
  install -Dm755 "$srcdir/mxp-$pkgver" "$pkgdir/usr/bin/mxp"
  install -Dm644 "$srcdir/LICENCE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENCE"
}
