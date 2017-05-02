# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=switchboard-plug-desktop
pkgver=0.2.5
pkgrel=1
pkgdesc='Switchboard Desktop Plug'
arch=('i686' 'x86_64')
url='https://github.com/elementary/switchboard-plug-pantheon-shell'
license=('GPL3')
groups=('pantheon')
depends=('gdk-pixbuf2' 'glib2' 'glibc' 'gnome-desktop' 'gtk3' 'libgee' 'plank'
         'libgranite.so' 'libswitchboard-2.0.so')
makedepends=('cmake' 'switchboard' 'vala')
source=("switchboard-plug-desktop-${pkgver}.tar.gz::https://github.com/elementary/switchboard-plug-pantheon-shell/archive/switchboard-plug-pantheon-shell-${pkgver}.tar.gz"
        'https://github.com/elementary/switchboard-plug-pantheon-shell/commit/c6dfa4307cc6f91728f8eaa74597ff16825aa551.patch')
sha256sums=('0deb16bd1e2a548e8cbc78d083e0cbab613cfa6c0a3be3c51b0519e489d71762'
            'd1bd5360f8559a7b32328999ac4ad6970bba68fd8caa820c4d19f8783dbe2656')

prepare() {
  cd switchboard-plug-pantheon-shell-switchboard-plug-pantheon-shell-${pkgver}

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build

  patch -Np1 -i ../c6dfa4307cc6f91728f8eaa74597ff16825aa551.patch
}

build() {
  cd switchboard-plug-pantheon-shell-switchboard-plug-pantheon-shell-${pkgver}/build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='/usr/lib'
  make
}

package() {
  cd switchboard-plug-pantheon-shell-switchboard-plug-pantheon-shell-${pkgver}/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
