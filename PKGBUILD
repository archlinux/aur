# Maintainer: aljazari
# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=green-recorder
pkgver=3.2.10
pkgrel=1
pkgdesc="Simple screen recorder for Linux desktop, supports Wayland & Xorg"
arch=(any)
url="https://github.com/dvershinin/green-recorder"
license=(GPL3)
depends=(python-pydbus python-gobject python-urllib3 ffmpeg imagemagick
         xorg-xdpyinfo xorg-xwininfo libappindicator-gtk3 gawk)
optdepends=('gnome-shell: Gnome on Wayland desktop recording')
makedepends=(python-setuptools)
options=(!emptydirs)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/dvershinin/green-recorder/archive/${pkgver}.tar.gz")
sha256sums=('3a45bd19975c402eb893442f81f477d3a0d625faf9aa229a77e887d94328f587')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  # desktop file is 755 for some reason
  # chmod 644 data/${pkgname}.desktop
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
