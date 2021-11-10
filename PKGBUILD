# Maintainer: Thomas Krug <t.krug@elektronenpumpe.de>
# Contributor: Joe Davison <joedavison.davison@gmail.com>

pkgname=scummvm-git
_pkgname=scummvm
pkgver=r124485.c8bd7716ea3
pkgrel=1
pkgdesc="A 'virtual machine' for several classic graphical point-and-click adventure games. - git version"
arch=('x86_64')
url="http://www.scummvm.org"
license=('GPL')
depends=('libpng' 'libtheora' 'sdl2' 'sdl2_net' 'fluidsynth' 'flac' 'faad2' 'libvorbis' 'libmad' 'freetype2'
         'libgl' 'glu' 'libjpeg-turbo' 'libmpeg2' 'curl' 'a52dec')
makedepends=('git' 'mesa')
conflicts=('scummvm')
provides=('scummvm')
source=("$_pkgname"::'git+https://github.com/scummvm/scummvm.git')
md5sums=('SKIP')
install=${_pkgname}.install

pkgver() {
  cd "${srcdir}/${_pkgname}"

  echo r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "${srcdir}/${_pkgname}"

  ./configure \
    --enable-release \
    --enable-all-engines \
    --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 dists/${_pkgname}.desktop "${pkgdir}"/usr/share/applications/${_pkgname}.desktop
}
