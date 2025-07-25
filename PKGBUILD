# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=walker
pkgver=0.13.12
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
sha256sums=('441f124ad894cf6779e7ebfc5119b5c1170a9bdb78bed23069fc597edf6767ce')
b2sums=('459f5de7c0bb38ceb34e0292c0faefab779b75775b115455e325cdab8c25e80d3c337f2abc2f755fc84c8e8ae9c9724587f6c8edcaa3f3f1b1f98cd1cc72d130')

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
