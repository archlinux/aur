# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Infy <eugene.yudin@gmail.com>

pkgname=pcsxr-svn
pkgver=1.9.93.r91911
pkgrel=1
pkgdesc='A Sony PlayStation emulator based on the PCSX-df Project'
arch=('i686' 'x86_64')
url='http://pcsxr.codeplex.com/'
license=('GPL')
depends=('gtk3' 'libarchive' 'libcdio' 'libxv' 'sdl2')
makedepends=('intltool' 'mesa' 'subversion')
[[ $CARCH == i686 ]] && makedepends+=('nasm')
provides=('pcsxr')
conflicts=('pcsxr' 'pcsx-df')
source=('svn+https://pcsxr.svn.codeplex.com/svn/pcsxr')
sha256sums=('SKIP')

pkgver() {
  cd pcsxr

  printf "1.9.93.r%s" "$(svnversion)"
}

build() {
  cd pcsxr

  chmod +x autogen.sh
  ./autogen.sh \
    --prefix='/usr' \
    --enable-{libcdio,opengl}
  make
}

package() {
  cd pcsxr

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
