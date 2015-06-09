# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=lightdm-pantheon-greeter
pkgver=2.0.0
pkgrel=2
pkgdesc='Pantheon greeter for LightDM'
arch=('i686' 'x86_64')
url='https://launchpad.net/pantheon-greeter'
license=('GPL')
groups=('pantheon')
depends=('clutter-gtk' 'granite' 'libindicator-gtk3' 'lightdm')
makedepends=('cmake' 'vala')
install='lightdm-pantheon-greeter.install'
source=("lightdm-pantheon-greeter-${pkgver}.tgz::https://launchpad.net/pantheon-greeter/freya/${pkgver}/+download/pantheon-greeter-${pkgver}.tgz"
        'lightdm-pantheon-greeter-paths.patch')
sha256sums=('5c81b907f33883e2f40d57d03c3a15e190aae71144143a170dca6cdf87ce6d8f'
            '164d93b3dd75a5dfa2ecb4095bbf0f366e778544b4769b4a5c47be1cef952d1b')

prepare() {
  cd pantheon-greeter-${pkgver}

  patch -Np1 -i ../lightdm-pantheon-greeter-paths.patch
}

build() {
  cd pantheon-greeter-${pkgver}

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
  cd pantheon-greeter-${pkgver}/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
