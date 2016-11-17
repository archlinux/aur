# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: sh4nks <sh4nks7@gmail.com

pkgname=lightdm-pantheon-greeter-bzr
pkgver=r499
pkgrel=1
pkgdesc='Pantheon greeter for LightDM'
arch=('i686' 'x86_64')
url='https://launchpad.net/pantheon-greeter'
license=('GPL')
groups=('pantheon-unstable')
depends=('cairo' 'clutter' 'clutter-gtk' 'cogl' 'gdk-pixbuf2' 'glib2' 'glibc'
         'gtk3' 'libgee' 'libgl' 'libx11' 'lightdm' 'pango'
         'libgranite.so' 'libwingpanel-2.0.so')
makedepends=('bzr' 'cmake' 'libxfixes' 'vala')
provides=('lightdm-pantheon-greeter')
conflicts=('lightdm-pantheon-greeter')
install='lightdm-pantheon-greeter.install'
source=('lightdm-pantheon-greeter::bzr+lp:pantheon-greeter'
        'lightdm-pantheon-greeter-paths.patch')
sha256sums=('SKIP'
            '2277e4a11c8945b72cca0ab116aaae86099ccd90833c18b7f74b400f6f674b7f')

pkgver() {
  cd lightdm-pantheon-greeter

  echo "r$(bzr revno)"
}

prepare() {
  cd lightdm-pantheon-greeter

  patch -Np1 -i ../lightdm-pantheon-greeter-paths.patch
}

build() {
  cd lightdm-pantheon-greeter

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build && cd build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DGSETTINGS_COMPILE='OFF'
  make
}

package() {
  cd lightdm-pantheon-greeter/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
