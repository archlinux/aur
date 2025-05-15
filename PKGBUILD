# Maintainer: Pranav Sharma <pranav.sharma.ama@gmail.com>
# Contributor: twa022 <twa022 at gmail dot com>

pkgname=miracle-wm
pkgver=0.5.2
pkgrel=1
pkgdesc="Wayland compositor based on mir"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/miracle-wm-org/miracle-wm"
license=('GPL-3.0-or-later')
depends=('mir'
         # implicit depends
         'libglvnd' 'yaml-cpp' 'bash' 'json-c' 'gcc-libs' 'libevdev' 'glib2' 'pcre2' 'glibc'
    )
makedepends=('cmake' 'nlohmann-json' 'ninja' 'glm' 'boost')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('382b51c1ad49522cbb36e5a0d41cb480a198490fe983e76a0f5401ecd9e234f1')

build() {

    local _flags=(
        -B build 
        -S "${pkgname}-${pkgver}" 
        -GNinja
        -Wno-dev
        -DCMAKE_BUILD_TYPE=None
        -DCMAKE_INSTALL_PREFIX=/usr
        -DCMAKE_INSTALL_LIBDIR=lib
        # miracle-wm options
        -DCMAKE_INSTALL_LIBEXECDIR=/usr/lib/$pkgname/
        -DSYSTEMD_INTEGRATION=ON
    )

    cmake "${_flags[@]}"
    cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
