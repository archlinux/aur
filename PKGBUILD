# Maintainer: yjun <jerrysteve1101 at gmail dot com>

pkgname=onscripter-gbk-git
_gitname=${pkgname%-git}
_ons_version="20130411"
pkgver=3.382ec29
pkgrel=1
pkgdesc="A GBK version of ONScripter, a game scripting engine"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://github.com/shouhuanxiaoji/ONScripter-GBK-Linux"
license=('GPL2')
depends=('bzip2'
         'sdl_image'
         'sdl_mixer'
         'sdl_ttf'
         'lua51'
         'fontconfig'
         'libjpeg-turbo'
         'libvorbis'
         'smpeg')
provides=("onscripter-gbk")
conflicts=("onscripter-gbk")
source=("${_gitname}::git+${url}"
        "onscripter-gbk-gcc-6.2.patch"
        "avifile-remove.patch"
        "target-optimizing.patch")
md5sums=('SKIP'
         'ffb513b2784747bea73591f48ee9737f'
         '33749eb33188e06f8731213acc7cd70e'
         'bd3ef482e08153f304479a75ab45bc8e')

pkgver() {
  cd "$_gitname"

  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  cd "$_gitname"

  patch -p1 < ${srcdir}/onscripter-gbk-gcc-6.2.patch
  patch -p1 < ${srcdir}/avifile-remove.patch
  patch -p1 < ${srcdir}/target-optimizing.patch
}

build() {
  cd "$_gitname"

  make -f Makefile.Linux
}

package() {
  install -Dm755 ${_gitname}/onscripter $pkgdir/usr/bin/onscripter-gbk
}

# vim: set sw=2 ts=2 et:

