# Maintainer: vagnum08 <vagnum08@gmail.com>

pkgname=cpupower-gui
pkgver=0.8.0
pkgrel=1
pkgdesc="A GUI utility to set CPU frequency limits"
arch=(any)
url="https://github.com/vagnum08/cpupower-gui"
license=('GPL')
depends=('python' 'gtk3' 'hicolor-icon-theme' 'polkit' 'python-dbus' 'python-gobject')
optdepends=('polkit-gnome: needed for authentification in Cinnamon, Gnome'
                      'lxsession: needed for authentification in Xfce, LXDE etc.')
makedepends=('meson')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("${pkgname}_${pkgver}.orig.tar.gz"::"https://github.com/vagnum08/cpupower-gui/archive/v${pkgver}.tar.gz")
sha256sums=('2c90249a7437f9e565fd12d070719ba97342ab08103f15d4a05ff6081cbbf825')

build() {
  meson --prefix /usr -Dsystemddir=/usr/lib/systemd --buildtype=plain "$srcdir/${pkgname}-${pkgver}" build
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}
