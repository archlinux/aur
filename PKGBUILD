# Maintainer: yjun <jerrysteve1101 at gmail dot com>

pkgname=onscripter-yuri
_gitname=OnscripterYuri
pkgdesc="An enhancement ONScripter project porting to many platforms, especially web."
pkgver=0.7.4
pkgrel=2
arch=('x86_64')
url="https://github.com/YuriSizuku/OnscripterYuri"
license=('GPL')
depends=('glibc'
         'sdl2'
         'sdl2_mixer'
         'sdl2_ttf'
         'sdl2_image'
         'libjpeg-turbo'
         'bzip2'
         'lua53'
         'fontconfig')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "ld-all-dynamic.patch")
sha256sums=('5084b3d7318c43d23a13a9a4847959804de19a46f0d5f9121db98ab4838dcb8c'
            '861d3d3729016d258056829940cce079393e83424c47ddadd4548377b7ae4b12')

prepare() {
  cd ${srcdir}/${_gitname}-${pkgver}
  
  patch --forward --strip=1 --input="${srcdir}/ld-all-dynamic.patch"
}

build() {
  cd ${srcdir}/${_gitname}-${pkgver}

  cd script
  
  chmod +x local_linux64.sh

  ./local_linux64.sh
}

package() {
  cd ${srcdir}/${_gitname}-${pkgver}
  
  install -Dm 755 build_linux64/onsyuri -t ${pkgdir}/usr/bin/
}

# vim: set sw=2 ts=2 et:
