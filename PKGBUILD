# Maintainer: yjun <jerrysteve1101 at gmail dot com>

pkgname=onscripter-jh-sdl2
pkgdesc="An optimized SDL2 port of ONScripter, a game scripting engine"
pkgver=0.7.3.05ef7ad
pkgrel=1
_commit=05ef7ad
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
# origin upstream is 404 now
# url="https://bitbucket.org/jh10001/onscripter-jh"
# 
# use a github fork
#define ONS_JH_VERSION "0.7.3"
#define ONS_VERSION "20161102"
#define NSC_VERSION 296
url="https://github.com/chf2000/ONScripter-Jh"
license=('GPL')
depends=('sdl2'
         'sdl2_mixer'
         'sdl2_ttf'
         'sdl2_image'
         'libjpeg-turbo'
         'bzip2'
         'libvorbis'
         'lua51'
         'fontconfig')
makedepends=('git'
            'clang'
            'openmp')
provides=('onscripter-jh')
conflicts=('onscripter-jh')
source=("${pkgname}::git+${url}"
        "01-simd-lua51.patch")
sha256sums=('SKIP'
            'f5a07348aa6bedefc4077c38e762c5fc1746df027b3bd979613f5c51b1325ab4')

pkgver() {
  cd ${srcdir}/${pkgname}

  printf "%s.%s" "$(head -n1 version.h | awk '{print $3}' | sed 's|\"||g')" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd ${srcdir}/${pkgname}
    
  patch -p1 < ${srcdir}/01-simd-lua51.patch 
}

build() {
  cd ${srcdir}/${pkgname}
    
  make -f Makefile.Linux onscripter
}

package() {
  cd ${srcdir}/${pkgname}

  install -Dm 755 ${srcdir}/${pkgname}/onscripter ${pkgdir}/usr/bin/onscripter-jh
}

# vim: set sw=2 ts=2 et:
