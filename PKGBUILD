# Maintainer: A. Benz <hello@benz.dev>
pkgname=walker-bin
license=('MIT')
pkgver=0.13.19
pkgrel=1
pkgdesc='wayland application runner'
url='https://github.com/abenz1267/walker'
depends=('gtk4-layer-shell' 'libvips' 'ffmpeg')
optdepends=('wl-clipboard: for clipboard module' 'libqalculate: for calculator module')
source_x86_64=("https://github.com/abenz1267/walker/releases/download/v$pkgver/walker_v${pkgver}_Linux_x86_64.tar.gz")
source_aarch64=("https://github.com/abenz1267/walker/releases/download/v$pkgver/walker_v${pkgver}_Linux_arm64.tar.gz")
arch=('x86_64' 'aarch64')
conflicts=('walker')
provides=('walker')
sha256sums_x86_64=('b956123075ff9451f8476599126c36d04272aa9411928aa85494c98aa843342a')
sha256sums_aarch64=('bc9a7ebc3b9c2894a45ea4fb895728ccdbfb6be0fba8a7d0a92f37beb84a3eee')

package() {
  cd "$srcdir/walker_v${pkgver}_Linux_$(uname -m | sed 's/x86_64/x86_64/; s/aarch64/arm64/')"

  install -Dm 755 walker -t "${pkgdir}/usr/bin"

  install -Dm 644 config.default.toml -t "${pkgdir}/etc/xdg/walker"
  mv "${pkgdir}/etc/xdg/walker/config.default.toml" "${pkgdir}/etc/xdg/walker/config.toml"

  cd themes
  install -Dm 644 default.toml -t "${pkgdir}/etc/xdg/walker/themes"
  install -Dm 644 default_window.toml -t "${pkgdir}/etc/xdg/walker/themes"

  install -Dm 644 xdg_default.css -t "${pkgdir}/etc/xdg/walker/themes"
  mv "${pkgdir}/etc/xdg/walker/themes/xdg_default.css" "${pkgdir}/etc/xdg/walker/themes/default.css"
}
