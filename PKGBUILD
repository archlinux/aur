# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=capnet-assist
pkgver=0.2
pkgrel=1
pkgdesc='Captive Portal Assistant'
arch=('i686' 'x86_64')
url='https://launchpad.net/capnet-assist'
license=('GPL3')
groups=('pantheon')
depends=('gcr' 'glib2' 'glibc' 'gtk3' 'libsoup' 'networkmanager' 'webkit2gtk')
makedepends=('cmake' 'intltool' 'vala')
source=("https://launchpad.net/capnet-assist/loki/${pkgver}/+download/capnet-assist-${pkgver}.tar.xz")
sha256sums=('f44f3abe8913a709b111bf105718cdb4a129b06704ad6d1b7bd516c3ab6a8134')

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
