# Maintainer: CreamSodass <greatvaluecreamsoda@gmail.com>

_plug=vship
pkgname=vapoursynth-plugin-vship-amd-git
pkgrel=2
pkgver=3.0.0.13.g1ed2fb3
pkgdesc="Plugin for Vapoursynth: vship for amd gpus (GIT version)"
arch=('x86_64')
url='https://github.com/Line-fr/Vship'
license=('MIT')
depends=('hip-runtime-amd')
makedepends=('git' 'make')
optdepends=('vapoursynth: vapoursynth plugin usage')
provides=("vapoursynth-plugin-vship" "libvship")
conflicts=("vapoursynth-plugin-vship" "libvship")
source=("vship::git+https://github.com/Line-fr/Vship.git")
sha256sums=('SKIP')

build() {
  cd "vship"
  export PATH="/opt/rocm/bin:/opt/rocm/lib/llvm/bin:${PATH}"
  export HIP_PATH=/opt/rocm

  make buildall
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
