# Maintainer: 
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=pangolin-desktop-bin
pkgver=210509
pkgrel=1
pkgdesc="Preview of Pangolin Desktop UI shell, designed for dahliaOS, written in Flutter."
arch=('x86_64')
url="https://github.com/dahlia-os/pangolin-desktop"
license=('Apache')
depends=('gtk3')
makedepends=('imagemagick')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-$pkgver.tar.xz::$url/releases/download/$pkgver/pangolin-desktop-x64.tar.xz"
        "${pkgname%-bin}.desktop")
noextract=("${pkgname%-bin}-$pkgver.tar.xz")
sha256sums=('fb406e3de0396c134b100d070ce4319c8c4a1a296d36013d5e723e22dbb14eb5'
            'f9b790200ac34e3dc038b0bc3366d91c08239762466ccc383fc2eb8f03ad2c02')

package() {
  install -d "$pkgdir/opt/${pkgname%-bin}"
  bsdtar -xvf "${pkgname%-bin}-$pkgver.tar.xz" -C "$pkgdir/opt/${pkgname%-bin}"

  install -d "$pkgdir/usr/bin"
  ln -s "/opt/${pkgname%-bin}/pangolin_desktop" "$pkgdir/usr/bin/${pkgname%-bin}"

  convert \
    "$pkgdir/opt/${pkgname%-bin}/data/flutter_assets/assets/images/logos/dahliaOS-logo.png" \
      -resize 1024 "$srcdir/dahliaOS_logo-1024.png"
  install -Dm644 "$srcdir/dahliaOS_logo-1024.png" \
    "$pkgdir/usr/share/pixmaps/${pkgname%-bin}.png"

  install -Dm644 "$srcdir/${pkgname%-bin}.desktop" -t "$pkgdir/usr/share/applications"
}
