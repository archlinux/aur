# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=switchboard-plug-about
pkgver=0.2.0
pkgrel=1
pkgdesc='About plug for Switchboard'
arch=('i686' 'x86_64')
url='https://launchpad.net/switchboard-plug-about'
license=('GPL3')
groups=('pantheon')
depends=('glib2' 'glibc' 'gtk3' 'libgee'
         'libswitchboard-2.0.so')
makedepends=('cmake' 'vala')
source=("https://launchpad.net/switchboard-plug-about/freya/${pkgver}/+download/switchboard-plug-about-${pkgver}.tgz"
        'about-archlinux.patch')
sha256sums=('18ee479055392bfe72d7891a7f8b21b71acda64acfc2f7c4b0377200e0fb4e2e'
            '792efaed1c32a03f058581887fe8fb48e53a9edadc66a0addd5ffbc7c288ad65')

prepare() {
  cd switchboard-plug-about-${pkgver}

  #patch -Np1 -i ../about-archlinux.patch

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd switchboard-plug-about-${pkgver}/build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='/usr/lib'
  make
}

package() {
  cd switchboard-plug-about-${pkgver}/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
