# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Ner0 <darkelfdarkelf666@yahoo.co.uk>

pkgname=audience
pkgver=0.1
pkgrel=1
pkgdesc='The Pantheon Video Player'
arch=('i686' 'x86_64')
url='https://launchpad.net/audience'
license=('GPL3')
groups=('pantheon')
depends=('clutter-gtk' 'desktop-file-utils' 'granite' 'gst-plugins-base-libs')
makedepends=('clutter-gst' 'cmake' 'vala')
install='audience.install'
source=("https://launchpad.net/audience/freya/${pkgver}/+download/audience-${pkgver}.tgz")
sha256sums=('adcf66ca073a24a0d29bf0ecbd5bfe1ad269e4b94c5fdd0101c7c269ed15d039')

build() {
  cd audience-${pkgver}

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build && cd build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DGSETTINGS_COMPILE='FALSE'
  make
}

package() {
  cd audience-${pkgver}/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
