# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=lightdm-pantheon-greeter
pkgver=2.0.2
pkgrel=1
pkgdesc='Pantheon greeter for LightDM'
arch=('i686' 'x86_64')
url='https://launchpad.net/pantheon-greeter'
license=('GPL')
depends=('atk' 'cairo' 'clutter' 'clutter-gtk' 'cogl' 'gdk-pixbuf2' 'glib2'
         'glibc' 'gtk3' 'libgee' 'libgl' 'libindicator-gtk3' 'libx11' 'lightdm'
         'pango'
         'libgranite.so')
makedepends=('cmake' 'vala')
install='lightdm-pantheon-greeter.install'
source=("lightdm-pantheon-greeter-${pkgver}.tgz::https://launchpad.net/pantheon-greeter/freya/${pkgver}/+download/pantheon-greeter-${pkgver}.tar.xz"
        'lightdm-pantheon-greeter-paths.patch')
sha256sums=('41c51a424828ad2d454e6def8259c42f62f868a7b55302fc585c5ce6f5fc70cd'
            '164d93b3dd75a5dfa2ecb4095bbf0f366e778544b4769b4a5c47be1cef952d1b')

prepare() {
  cd pantheon-greeter-${pkgver}

  patch -Np1 -i ../lightdm-pantheon-greeter-paths.patch

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd pantheon-greeter-${pkgver}/build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DGSETTINGS_COMPILE='FALSE'
  make
}

package() {
  cd pantheon-greeter-${pkgver}/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
