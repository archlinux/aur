# Maintainer: Katoitalia

pkgname=obs-rgb-levels-filter-git
pkgver=master.r0.geaada12
pkgrel=1
arch=(x86_64)
pkgdesc="A simple OBS Studio filter to adjust RGB levels git version"
url="https://github.com/petrifiedpenguin/obs-rgb-levels-filter"
license=('GPL2')
depends=("obs-studio")
makedepends=("cmake" "git")
provides=("obs-rgb-levels-filter-git")
source=("$pkgname::git+https://github.com/petrifiedpenguin/obs-rgb-levels-filter.git"
        "git+https://github.com/obsproject/obs-studio.git")
md5sums=("SKIP" "SKIP")

pkgver() {
  cd $pkgname
  git describe --long --tags --all | sed -r "s/([^-]*-g)/r\1/;s/-/./g" | awk 'BEGIN { FS = "/"} {print $2}'
}

package() {
  cd $pkgname

  mkdir -p build; cd build

  cmake \
     -DOBS_SRC_DIR="$srcdir"/obs-studio \
     -DLIBOBS_LIB=/usr/lib/libobs.so \
     -DCMAKE_INSTALL_PREFIX="$pkgdir"/usr ..

  make -j$(($(nproc)+1))
  make install
}
