# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=switchboard-git
pkgver=r1176.da62a1d
pkgrel=1
pkgdesc='The Pantheon Control Center'
arch=('x86_64')
url='https://github.com/elementary/switchboard'
license=('GPL3')
groups=('pantheon-unstable')
depends=('clutter-gtk' 'glib2' 'glibc' 'gtk3' 'libgee'
         'libgranite.so')
makedepends=('cmake' 'git' 'granite-git' 'intltool' 'vala')
optdepends=('switchboard-plug-about-bzr: About plug'
            'switchboard-plug-default-applications-bzr: Default applications plug'
            'switchboard-plug-elementary-tweaks-bzr: Elementary tweaks plug'
            'switchboard-plug-keyboard-bzr: Keyboard plug'
            'switchboard-plug-pantheon-shell-bzr: Pantheon Shell plug'
            'switchboard-plug-power-bzr: Power plug')
provides=('switchboard' 'libswitchboard-2.0.so')
conflicts=('switchboard')
replaces=('switchboard-bzr')
source=('git+https://github.com/elementary/switchboard.git')
sha256sums=('SKIP')

pkgver() {
  cd switchboard

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd switchboard

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd switchboard/build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='lib' \
    -DGSETTINGS_COMPILE='FALSE' \
    -DUSE_UNITY='FALSE'
  make
}

package() {
  cd switchboard/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
