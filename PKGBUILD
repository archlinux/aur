# Maintainer: Michael DeGuzis <mdeguzis@gmail.com>
# Credit: Maxime Gauduin <alucryd@archlinux.org>

pkgname=libretro-shaders-all-git
_gitname=libretro-shaders
pkgver=r629.237bb5b
pkgrel=1
pkgdesc='Collection of shaders for libretro (git-latest)'
arch=('any')
url='http://www.libretro.com/'
license=('GPL')
groups=('libretro')
conflicts=('libretro-shaders')
provides=('libretro-shaders')
makedepends=('git' 'nvidia-cg-toolkit' 'python' 'retroarch')
source=('libretro-shaders::git+https://github.com/libretro/common-shaders.git')
sha256sums=('SKIP')

pkgver() {


  cd $_gitname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

build() {

  retroarch-cg2glsl libretro-shaders shaders

}

package() {

  install -dm 755 "${pkgdir}"/usr/share/libretro
  cp -dr --no-preserve='ownership' shaders "${pkgdir}"/usr/share/libretro/

}
