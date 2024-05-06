# Maintainer: ErrrorMaxx <herobrine135111@gmail.com>
pkgname=minivcmouse
pkgver=1.0
_commit=b2c53eed578b6d7c2212b52a80f4810ffe9b4bcb
pkgrel=1
pkgdesc='A simple linux console mouse daemon'
arch=(any)
url='https://github.com/textshell/minivcmouse'
license=('GPL2')
depends=(libinput libudev0)
makedepends=(meson)
optdepends=()
source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/${_commit}.tar.gz"
  minivcmouse.service
)
sha256sums=('e1359696f484320f9ba61834b4332ba2bb560b380853605f2d92c6cd4bfea8a3'
            '195dd84ac5dc0faca7609d83377da963ebe439b38144920f6fb30a919ec89c68')

build() {
  arch-meson "${pkgname}-${_commit}" build
  meson compile -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
  install -Dm644 minivcmouse.service "${pkgdir}/etc/systemd/system/minivcmouse.service"
}