# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=pantheon-polkit-agent
pkgver=0.1.4
pkgrel=1
pkgdesc='Pantheon Polkit Agent'
arch=('i686' 'x86_64')
url='https://github.com/elementary/pantheon-agent-polkit'
license=('GPL3')
groups=('pantheon')
depends=('glib2' 'glibc' 'gtk3' 'polkit')
makedepends=('cmake' 'cmake-modules-elementary-git' 'intltool' 'vala')
source=("pantheon-polkit-agent-${pkgver}.tar.gz::https://github.com/elementary/pantheon-agent-polkit/archive/${pkgver}.tar.gz")
sha256sums=('a8885d35bb58b4b02ac40acf0da14577e15ea2c02170d260b8aaa18761ab10d3')

prepare() {
  cd pantheon-agent-polkit-${pkgver}

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd pantheon-agent-polkit-${pkgver}/build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr'
  make
}

package() {
  cd pantheon-agent-polkit-${pkgver}/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
