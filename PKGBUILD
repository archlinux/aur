# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=walker
pkgver=0.13.11
pkgrel=1
pkgdesc='wayland application runner'
url='https://github.com/abenz1267/walker'
arch=('any')
license=('MIT')
makedepends=('go' 'gobject-introspection')
depends=('gtk4-layer-shell' 'libvips' 'ffmpeg')
optdepends=('wl-clipboard: for clipboard module' 'libqalculate: for calculator module')
conflicts=('walker')
provides=('walker')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('6d12b40412e91ef4f6e79fa47b6b22daf3ebae2ffe5a583fdf39dd5982f8afed')
b2sums=('cf5b89f64c6a35a1f244e39220cd68c21b0b6eee34bdc6ff0f199c3cd4ed61fab455da7e754efe4fc592c5e8139587e8ccc9e868e4beccd444b50179c5c80aa1')

build() {
  cd ${pkgname}-${pkgver}/cmd

  go build -x -o walker
}

package() {
  cd ${pkgname}-${pkgver}/cmd
  install -Dm 755 walker -t "${pkgdir}/usr/bin"

  cd ../
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"

  cd internal/config
  install -Dm 644 config.default.toml -t "${pkgdir}/etc/xdg/walker"
  mv "${pkgdir}/etc/xdg/walker/config.default.toml" "${pkgdir}/etc/xdg/walker/config.toml"

  cd themes
  install -Dm 644 default.toml -t "${pkgdir}/etc/xdg/walker/themes"

  install -Dm 644 xdg_default.css -t "${pkgdir}/etc/xdg/walker/themes"
  mv "${pkgdir}/etc/xdg/walker/themes/xdg_default.css" "${pkgdir}/etc/xdg/walker/themes/default.css"
}
