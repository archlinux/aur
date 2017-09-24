# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=lightdm-pantheon-greeter
pkgver=3.2.0
pkgrel=1
pkgdesc='Pantheon greeter for LightDM'
arch=('i686' 'x86_64')
url='https://github.com/elementary/greeter'
license=('GPL')
depends=('cairo' 'clutter' 'clutter-gtk' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3'
         'libgee' 'libgl' 'libx11' 'lightdm'
         'libgranite.so' 'libwingpanel-2.0.so')
makedepends=('cmake' 'vala' 'wingpanel')
source=("lightdm-pantheon-greeter-${pkgver}.tar.gz::https://github.com/elementary/greeter/archive/${pkgver}.tar.gz"
        'lightdm-pantheon-greeter-paths.patch')
sha256sums=('3d97370e94067ecc6040e825e7e8122f58c50ff04e168c3cc73fa2dbffdcb130'
            '64911a77369693a85563459ff372c4f7daba09825e7f66f2b98b60ab2b7ecd76')

prepare() {
  pushd greeter-${pkgver}
  patch -Np1 -i ../lightdm-pantheon-greeter-paths.patch
  popd

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd build

  cmake ../greeter-${pkgver} \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DGSETTINGS_COMPILE='FALSE'
  make
}

package() {
  cd build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
