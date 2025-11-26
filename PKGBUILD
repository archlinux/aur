# Maintainer: CreamSodass <greatvaluecreamsoda@gmail.com>

_plug=vship
pkgname=vapoursynth-plugin-vship-cuda-git
pkgrel=3
pkgver=4.0.0.21.g5308ad8
pkgdesc="Plugin for Vapoursynth: vship for nvidia gpus (GIT version)"
arch=('x86_64')
url='https://github.com/Line-fr/Vship'
license=('MIT')
depends=('cuda')
makedepends=('git' 'make')
optdepends=('vapoursynth: vapoursynth plugin usage')
provides=("vapoursynth-plugin-vship" "libvship")
conflicts=("vapoursynth-plugin-vship" "libvship")
source=("vship::git+https://github.com/Line-fr/Vship.git")
sha256sums=('SKIP')

build() {
  cd "vship"
  export PATH="/opt/cuda/bin:$PATH"

  make buildcudaall
}

pkgver() {
  cd "${srcdir}/vship"
  # Generate pkgver like: v3.0.0.0.g7cd1d4f
  git describe --tags --long | sed 's/^v//;s/-/./g'
}

package(){
  cd "vship"
  make PREFIX="/usr" DESTDIR="${pkgdir}" install
}
