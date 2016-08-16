# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Infy <eugene.yudin@gmail.com>

pkgname=pcsxr-git
pkgver=1.9.93.r1662.fc378b6
pkgrel=1
pkgdesc='A Sony PlayStation emulator based on the PCSX-df Project'
arch=('i686' 'x86_64')
url='http://pcsxr.codeplex.com/'
license=('GPL')
depends=('gtk3' 'libarchive' 'libcdio' 'libxv' 'sdl2')
makedepends=('git' 'intltool' 'mesa')
[[ $CARCH == i686 ]] && makedepends+=('nasm')
provides=('pcsxr')
conflicts=('pcsxr' 'pcsx-df')
replaces=('pcsxr-svn')
source=('git+https://git01.codeplex.com/pcsxr')
sha256sums=('SKIP')

pkgver() {
  cd pcsxr

  echo "1.9.93.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd pcsxr/pcsxr

  chmod +x autogen.sh
  ./autogen.sh \
    --prefix='/usr' \
    --enable-{libcdio,opengl}
  make
}

package() {
  cd pcsxr/pcsxr

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
