pkgname="plotinus-unityx-git"
pkgver=v10.0.rc4.r1.gdf9443a
pkgrel=1
pkgdesc="HUD for UnityX"
arch=(any)
depends=("gtk3")
makedepends=("git" "vala" "cmake")
license=("GPL")
source=('plotinus::git+https://gitlab.com/ubuntu-unity/unity-x/plotinus.git')
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/plotinus"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/plotinus"
  rm -rf build
  mkdir build && cd build
  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
  make -j $(nproc)
}

package() {
  cd "${srcdir}/plotinus/build"
  make DESTDIR="$pkgdir/" install
}
