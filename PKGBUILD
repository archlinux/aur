# Maintainer: yjun <jerrysteve1101 at gmail dot com>

pkgname=onscripter-yuri
_gitname=OnscripterYuri
pkgdesc="An enhancement ONScripter project porting to many platforms, especially web."
pkgver=0.7.4
pkgrel=3
arch=('x86_64' 'aarch64')
url="https://github.com/YuriSizuku/OnscripterYuri"
license=('GPL')
depends=('glibc'
         'gcc-libs'
         'sdl2'
         'sdl2_mixer'
         'sdl2_ttf'
         'sdl2_image'
         'libjpeg-turbo'
         'bzip2'
         'lua53'
         'fontconfig')
makedepends=("cmake")
provides=("onsyuri")
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "ld-all-dynamic.patch")
sha256sums=('5084b3d7318c43d23a13a9a4847959804de19a46f0d5f9121db98ab4838dcb8c'
            '861d3d3729016d258056829940cce079393e83424c47ddadd4548377b7ae4b12')

prepare() {
  cd ${srcdir}/${_gitname}-${pkgver}
  
  patch --forward --strip=1 --input="${srcdir}/ld-all-dynamic.patch"
}

build() {
  cd ${srcdir}/

  cmake -B build -S "${_gitname}-${pkgver}" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
  cmake --build build
}

package() {
  # DESTDIR="$pkgdir" cmake --install build : it doesn't work
  install -Dm 755 build/onsyuri -t ${pkgdir}/usr/bin/
}

# vim: set sw=2 ts=2 et:
