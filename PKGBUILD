# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=capnet-assist
pkgver=0.2.0.1
pkgrel=1
pkgdesc='Captive Portal Assistant'
arch=('x86_64')
url='https://launchpad.net/capnet-assist'
license=('GPL3')
groups=('pantheon')
depends=('gcr' 'glib2' 'glibc' 'gtk3' 'libsoup' 'networkmanager' 'webkit2gtk')
makedepends=('cmake' 'intltool' 'vala')
source=("https://launchpad.net/capnet-assist/loki/${pkgver}/+download/capnet-assist-${pkgver}.tar.xz")
sha256sums=('d278b62940d985a55e00b1e17be3e336949be9d89e165bc744226afcfd624e44')

prepare() {
  cd capnet-assist-${pkgver}

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd capnet-assist-${pkgver}/build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr/'
  make
}

package() {
  cd capnet-assist-${pkgver}/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
