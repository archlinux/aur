# Maintainer: yjun <jerrysteve1101 at gmail dot com>
# Contributor: dianlujitao <dianlujitao at gmail dot com>

pkgname=onscripter-jh
pkgdesc="An optimized SDL2 port of ONScripter, a game scripting engine"
pkgver=0.7.6
pkgrel=1
_commit=848ebadd3fd54b2c
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
# origin upstream is 404 now
# url="https://bitbucket.org/jh10001/onscripter-jh"
# 
# use a github fork
# ONS_JH_VERSION "0.7.6"
# ONS_VERSION "20181218"
# NSC_VERSION 296
url="https://github.com/weimingtom/onscripter_jh_sdl2_fork"
license=('GPL')
depends=('sdl2'
         'sdl2_mixer'
         'sdl2_ttf'
         'sdl2_image'
         'libjpeg-turbo'
         'bzip2'
         'libvorbis'
         'lua'
         'fontconfig')
source=("${pkgname}::git+${url}"
        "display-flash-fix.patch"
        "simd-remove.patch"
        "lua51.patch")
sha256sums=('SKIP'
            'e9ecb802e327de4e8ab81dc84c294f20e629900472d3d4d703ac1e10c418cfff'
            '15f7f0d457618ab86a78ef91495acf544e34eaf6d4fce44e94ed0c7bc72c710b'
            '321776cd8f641f510849edd959ebd0383453a38f1ef8d17c8f36f035f43780cc')

prepare() {
  cd ${srcdir}/${pkgname}
    
  mv onscripter.cpp ONScripter.cpp

  patch -p1 < ${srcdir}/simd-remove.patch 
  patch -p1 < ${srcdir}/display-flash-fix.patch
  patch -p1 < ${srcdir}/lua51.patch
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