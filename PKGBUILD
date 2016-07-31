# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=d2vwitch-git
pkgver=v1.16.g73919e1
pkgrel=1
pkgdesc="Cross-platform D2V creator. (GIT version)"
arch=('i686' 'x86_64')
url='http://forum.doom9.org/showthread.php?t=173090'
license=('LGPL2.1' 'ISC')
depends=('vapoursynth'
         'libavutil.so'
         'libavformat.so'
         'libavcodec.so'
         'gcc-libs'
         'qt5-base'
         'xdg-utils'
         )
makedepends=('git')
provides=('d2vwitch')
conflicts=('d2vwitch')
source=('d2vwitch::git+https://github.com/dubhater/D2VWitch.git'
        'd2vwitch.desktop')
sha1sums=('SKIP'
          '146fa44a5e8bba029592d63cbd55b1a4d4184578')

pkgver() {
  cd d2vwitch
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  cd d2vwitch
  ./autogen.sh
}

build() {
  cd d2vwitch
  ./configure \
    --prefix=/usr
  make
}

package() {
  make -C d2vwitch DESTDIR="${pkgdir}" install

  install -Dm644 "${srcdir}/d2vwitch.desktop" "${pkgdir}/usr/share/applications/d2vwitch.desktop"
}
