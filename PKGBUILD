# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: carstene1ns <arch.carsten@teibes.de>
# Contributor: Jameson Pugh <imntreal@gmail.com>
# Contributor: Sven-Hendrik Haase <svenstaro@archlinux.org>

pkgname=lib32-sdl2_mixer
pkgver=2.8.1
pkgrel=1
pkgdesc='A simple multi-channel audio mixer (Version 2)'
arch=(x86_64)
url=https://github.com/libsdl-org/SDL_mixer
license=(MIT)
depends=(
  lib32-gcc-libs
  lib32-flac
  lib32-glibc
  lib32-libmodplug
  lib32-libvorbis
  lib32-mpg123
  lib32-sdl2
  sdl2_mixer
)
makedepends=(
  git
  lib32-fluidsynth
)
optdepends=('lib32-fluidsynth: MIDI software synth, replaces built-in timidity')
source=("https://github.com/libsdl-org/SDL_mixer/releases/download/release-${pkgver}/SDL2_mixer-${pkgver}.tar.gz"{,.sig})
sha512sums=('6148591404b2113bcdb54391821658548acfe380a9cba660113e55e6f2fb7da2a5a59a99fefe51a0d7f8b91160648f11f72750353da88d285a962e3a410aecd7'
            'SKIP')
validpgpkeys=('1528635D8053A57F77D1E08630A59377A7763BE6')

build() {
  cd "${srcdir}/SDL2_mixer-${pkgver}/"

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH=/usr/lib32/pkgconfig
  ./configure \
    --prefix=/usr \
    --libdir=/usr/lib32 \
    --disable-static
  make
}

package() {
  cd "${srcdir}/SDL2_mixer-${pkgver}/"

  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/include

  install -dm 755 "${pkgdir}"/usr/share/licenses
  ln -s sdl2_mixer "${pkgdir}"/usr/share/licenses/lib32-sdl2_mixer
}

# vim: ts=2 sw=2 et:
