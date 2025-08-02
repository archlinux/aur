# Maintainer: A. Benz <hello@benz.dev>
pkgname=walker-bin
license=('MIT')
pkgver=0.13.14
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
sha256sums_x86_64=('9dacfa7bf4d87396425d6c51a7281b562118698f40a449a458d89933b9a89a65')
sha256sums_aarch64=('28ab15fbb332a749831c370964ebfa5bb00960c22c071d49a02d0f32460ff47b')

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
