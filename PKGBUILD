# Maintainer: Lili1228 <aur at lili dot lgbt>
# Contributor: Boris Timofeev <mashin87@gmail.com>
# Contributor: Fabio Cavallo (FHorse) <punes.development@gmail.com>
pkgname=punes
pkgver=0.111
pkgrel=1
pkgdesc="Nintendo Entertaiment System emulator"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/punesemu/puNES"
license=('GPL-2.0-or-later')
depends=('alsa-lib' 'ffmpeg' 'hicolor-icon-theme' 'nvidia-cg-toolkit' 'libxrandr' 'qt6-base' 'qt6-svg' # explicit
'gcc-libs' 'glibc' 'libglvnd' 'libx11' 'libudev.so') # implicit
makedepends=('cmake>=3.15' 'glu' 'qt6-tools')
source=("puNES-${pkgver}.tar.gz"::"https://github.com/punesemu/puNES/archive/v$pkgver.tar.gz")
sha512sums=('6388cdf2b303e217adfe43b1b3b1ef66a75b6adfdb0363b213c47fc129b5815f3e96814ee25a3637147dc184203cef0438930c280f0c6249085ecac1220b435c')

# AUR 0.108-1 says lib7zip breaks with buildflags, but I can't find any proof, it builds and loads zips
#options=('!buildflags')

build() {
  cmake -S"puNES-${pkgver}" -Bbuild -DCMAKE_INSTALL_PREFIX=/usr -DENABLE_OPENGL_CG=on -DENABLE_QT6_LIBS=on -DDISABLE_PORTABLE_MODE=on
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --build "${srcdir}/build" --target install
}

# vim:set ts=2 sw=2 et:
