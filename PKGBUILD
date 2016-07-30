# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=d2vwitch-git
pkgver=v1.11.ga045c62
pkgrel=1
pkgdesc="Cross-platform D2V creator. (GIT version)"
arch=('i686' 'x86_64')
url='http://forum.doom9.org/showthread.php?t=173090'
license=('LGPL2.1' 'ISC')
depends=('libavutil.so'
         'libavformat.so'
         'libavcodec.so'
         'gcc-libs'
         'qt5-base'
         )
makedepends=('git')
provides=('d2vwitch')
conflicts=('d2vwitch')
source=('d2vwitch::git+https://github.com/dubhater/D2VWitch.git'
        'd2vwitch.desktop')
sha1sums=('SKIP')

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
