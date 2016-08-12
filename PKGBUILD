# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=switchboard-plug-security-privacy
pkgver=0.1.1
pkgrel=1
pkgdesc='Security & Privacy plug for Switchboard'
arch=('i686' 'x86_64')
url='https://launchpad.net/switchboard-plug-security-privacy'
license=('GPL3')
depends=('elementary-dpms-helper-bzr' 'glib2' 'glibc' 'gtk3' 'libgee'
         'light-locker' 'polkit' 'ufw' 'zeitgeist'
         'libgranite.so' 'libswitchboard-2.0.so')
makedepends=('cmake' 'vala')
source=("https://launchpad.net/switchboard-plug-security-privacy/loki/${pkgver}/+download/switchboard-plug-security-privacy-${pkgver}.tar.xz")
sha256sums=('07ea2d582c89142ee5fc2d1f898ccaec9543247a705a276b39b4349d80e90d57')

prepare() {
  cd switchboard-plug-security-privacy-${pkgver}

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd switchboard-plug-security-privacy-${pkgver}/build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='/usr/lib'
  make
}

package() {
  cd switchboard-plug-security-privacy-${pkgver}/build

  make DESTDIR="${pkgdir}" install
  chmod 755 "${pkgdir}"/usr/lib/switchboard/personal/pantheon-security-privacy/security-privacy-plug-helper
}

# vim: ts=2 sw=2 et:
