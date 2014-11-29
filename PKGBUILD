# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=gltron
pkgver=0.70
pkgrel=4
pkgdesc="A tron-like lightcycle game with a nice 3D perspective"
arch=('i686' 'x86_64')
url="http://www.gltron.org"
license=('GPL')
depends=('libgl' 'gcc-libs' 'smpeg' 'sdl_sound' 'libpng' 'glu')
makedepends=('patch')
options=('!makeflags')
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver-source.tar.gz
        http://upload.wikimedia.org/wikipedia/commons/thumb/5/58/GLTron.png/120px-GLTron.png
        gltron-0.70-configure.patch
        gltron-0.70-prototypes.patch
        gltron-0.70-debian.patch
        gltron.desktop)
md5sums=('300e54914844f36c199415d6d8b0372a'
         '794e6160e815040951af7ec7fcba9278'
         '9cd844f561d537df49a35fac21d5b51c'
         '744c0f80394f8713aebdf7038044570e'
         'd53c903bba366af12c1fdcc578d32da1'
         '1f36bf3e65cc8791301b79b9024ab51a')

build() {
  cd "${srcdir}"/$pkgname-$pkgver

  patch -Np0 -i "${srcdir}"/gltron-0.70-configure.patch
  patch -Np0 -i "${srcdir}"/gltron-0.70-prototypes.patch

  if [ "$CARCH" = "x86_64" ]; then
   patch -Np0 -i "${srcdir}"/gltron-0.70-debian.patch
  fi

  ./configure --prefix=/usr --enable-warn=off
  make
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver
  make DESTDIR="${pkgdir}" install

  install -D -m644 "${srcdir}"/120px-GLTron.png \
    "${pkgdir}"/usr/share/gltron/pics/gltron.png
  install -D -m644 "${srcdir}"/gltron.desktop \
    "${pkgdir}"/usr/share/applications/gltron.desktop
}
