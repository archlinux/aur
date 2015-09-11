# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Ner0 <darkelfdarkelf666@yahoo.co.uk>
# Contributor: dserban <dserban01@yahoo.com>

pkgname=switchboard
pkgver=2.0.1
pkgrel=2
pkgdesc='The Pantheon Control Center'
arch=('i686' 'x86_64')
url='https://launchpad.net/switchboard'
license=('GPL3')
groups=('pantheon')
depends=('clutter-gtk' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'libgee' 'wayland'
         'libgranite.so')
makedepends=('cmake' 'vala')
optdepends=('switchboard-plug-about: About plug'
            'switchboard-plug-applications: Applications plug'
            'switchboard-plug-datetime: Date & Time plug'
            'switchboard-plug-desktop: Desktop plug'
            'switchboard-plug-display: Display plug'
            'switchboard-plug-elementary-tweaks: Elementary Tweaks plug'
            'switchboard-plug-keyboard: Keyboard plug'
            'switchboard-plug-locale: Locale plug'
            'switchboard-plug-network: Network plug'
            'switchboard-plug-notifications: Notifications plug'
            'switchboard-plug-power: Power plug'
            'switchboard-plug-security-privacy: Security & Privacy plug')
provides=('libswitchboard-2.0.so')
install='switchboard.install'
source=("https://launchpad.net/switchboard/${pkgver%.*.*}.x/${pkgver}/+download/switchboard-${pkgver}.tgz")
sha256sums=('a67ca60e002459e8e3d65b6c57440e86ebd0eb33a863561808b748901d46b4e8')

prepare() {
  cd switchboard-${pkgver}

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd switchboard-${pkgver}/build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='/usr/lib' \
    -DGSETTINGS_COMPILE='FALSE' \
    -DUSE_UNITY='FALSE'
  make
}

package() {
  cd switchboard-${pkgver}/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
