# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Ner0 <darkelfdarkelf666@yahoo.co.uk>
# Contributor: dserban <dserban01@yahoo.com>

pkgname=switchboard
pkgver=2.3.2
pkgrel=1
pkgdesc='The Pantheon Control Center'
arch=('x86_64')
url='https://github.com/elementary/switchboard'
license=('GPL3')
groups=('pantheon')
depends=('clutter-gtk' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'libgee' 'wayland'
         'libgranite.so')
makedepends=('cmake' 'git' 'intltool' 'vala')
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
source=("git+https://github.com/elementary/switchboard.git#tag=${pkgver}")
sha256sums=('SKIP')

prepare() {
  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd build

  cmake ../switchboard \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='/usr/lib' \
    -DGSETTINGS_COMPILE='OFF' \
    -DUSE_UNITY='OFF'
  make
}

package() {
  make DESTDIR="${pkgdir}" -C build install
}

# vim: ts=2 sw=2 et:
