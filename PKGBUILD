# Maintainer: Kyle Brooks <brookskd@gmail.com>
pkgname=cmvs-pmvs-git
pkgver=r24.a067274
pkgrel=3
pkgdesc='Takes output from structure from motion frameworks (SfM) and produces dense 3D reconstruction from the camera poses and imagery.'
arch=('i686' 'x86_64')
url='https://github.com/pmoulon/CMVS-PMVS'
license=('GPL')
depends=('libjpeg' 'boost-libs')
makedepends=('git' 'cmake' 'boost')
provides=('cmvs' 'pmvs')
conflicts=('cmvs' 'pmvs')
_gitname='CMVS-PMVS'
source=("git+https://github.com/pmoulon/${_gitname}.git"
       )
md5sums=('SKIP'
        )

pkgver() {
  cd "${srcdir}/${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}"
  mkdir -p cmvs-pmvs_build
  cd cmvs-pmvs_build
  cmake -DCMAKE_BUILD_TYPE=RELEASE "../${_gitname}/program"
  make
}

package() {
  cd "${srcdir}/cmvs-pmvs_build"
  install -Dm755 main/cmvs "${pkgdir}/usr/bin/cmvs"
  install -Dm755 main/genOption "${pkgdir}/usr/bin/genOption"
  install -Dm755 main/pmvs2 "${pkgdir}/usr/bin/pmvs2"
}

# vim:set ts=2 sw=2 et:
