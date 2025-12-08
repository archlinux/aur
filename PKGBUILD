# Maintainer: Antoni Marzec <marzeqmarzeq@gmail.com>

_plug_name=virtual-desktops
pkgname=hyprland-plugin-${_plug_name}
pkgver=2.2.8
_hyprver=0.52.2
pkgrel=1
pkgdesc="A plugin for the Hyprland compositor, implementing virtual-desktop functionality."
arch=('x86_64')
url="https://github.com/levnikmyskin/hyprland-${_plug_name}"
license=('BSD')
source=(${pkgname}::git+https://github.com/levnikmyskin/hyprland-${_plug_name}.git#tag=v${pkgver})
sha512sums=('78a3750eea05891220697855abb9ed53533b3c2e1a7133e58d59e9e7d828fb99fd08fe056d2974c18a5e68ea501153d504de69b5d94453f83612a0d2b4936b6b')
depends=("hyprland=${_hyprver}")
makedepends=('git' 'hyprland' 'cmake')
options=(!debug)

build() {
  cd "${srcdir}/${pkgname}"
  make all
}

package() {
  cd "${srcdir}/${pkgname}"
  local so_name="virtual-desktops.so"
  install -Dm755 ${so_name} "$pkgdir/usr/lib/hyprland/${so_name}"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/hyprland-plugin-${_plug_name}/LICENSE"
}

