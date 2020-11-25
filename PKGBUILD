# Maintainer: aljazari
# Maintainer: Fabio Loli <lolix@disroot.org>

pkgname=green-recorder
pkgver=3.2.8
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
sha256sums=('5f37eb5182eab631de212a639118635fe14bba1de5c1d8ec7e02c46d01ffee2c')

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
