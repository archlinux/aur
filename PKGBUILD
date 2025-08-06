# Maintainer: A. Benz <hello@benz.dev>
pkgname=walker-bin
license=('MIT')
pkgver=0.13.22
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
sha256sums_x86_64=('e04c65ddc667e91730453eb7325968d06b9604ccd58b2afe795fdc18b7d49e38')
sha256sums_aarch64=('72bd701c4020b9a652ff3e34a4b8d46390365760abbc6c83f308e9e57daff114')

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
