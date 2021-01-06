# Maintainer: Emilien Devos (unixfox) <contact@emiliendevos.be>
# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=green-recorder-git
pkgver=3.2.8.r0.g6d4d44e
pkgrel=1
pkgdesc="Simple screen recorder for Linux desktop, supports Wayland & Xorg"
arch=(any)
url="https://github.com/dvershinin/green-recorder"
license=(GPL3)
depends=(python-pydbus python-gobject python-urllib3 ffmpeg imagemagick
         xorg-xdpyinfo xorg-xwininfo libappindicator-gtk3 gawk)
optdepends=('gnome-shell: Gnome on Wayland desktop recording')
makedepends=(git python-setuptools)
options=(!emptydirs)
provides=(green-recorder)
conflicts=(green-recorder)
source=("git+https://github.com/dvershinin/green-recorder")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname%-git}"
  python setup.py build
}

package() {
  cd "${pkgname%-git}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
