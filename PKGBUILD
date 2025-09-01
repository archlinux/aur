# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: A. Benz <hello@benz.dev>

_pkgauthor=abenz1267
_pkgname=walker
pkgname=${_pkgname}-bin
pkgver=0.13.26
_pkgvername=v${pkgver}
pkgrel=1
pkgdesc='wayland application runner'
arch=('x86_64' 'aarch64')
_barch=('x86_64' 'arm64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('MIT')

optdepends=('wl-clipboard: for clipboard module' 'libqalculate: for calculator module')
depends=('gtk4-layer-shell' 'libvips' 'ffmpeg')
conflicts=("${_pkgname}")
provides=("${_pkgname}")

source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tar.gz::${url}/releases/download/${_pkgvername}/${_pkgname}_${_pkgvername}_Linux_${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tar.gz::${url}/releases/download/${_pkgvername}/${_pkgname}_${_pkgvername}_Linux_${_barch[0]}.tar.gz")
sha256sums_x86_64=('a5e910c349e2d33186938dad55a72d03e64819832a95348397b53c9d6d92eb7f')
sha256sums_aarch64=('a5e910c349e2d33186938dad55a72d03e64819832a95348397b53c9d6d92eb7f')


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
