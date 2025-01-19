pkgname="mysh-git"
pkgver="1.0"
pkgrel="1"
pkgdesc=" This is My Shell"
arch=("x86_64")
url="https://github.com/AImixAE/mysh"
makedepends=("patchelf" "gcc" "cmake" "ninja")
# source=("git+${url}")
source=("https://github.com/AImixAE/mysh/archive/refs/heads/main.zip")
sha512sums=("SKIP")

package() {
  install -D ${srcdir}/build/main ${pkgdir}/usr/bin/mysh
  install -D ${srcdir}/build/lib*.so -t ${pkgdir}/usr/lib/mysh
  patchelf --set-rpath /usr/lib/mysh ${pkgdir}/usr/bin/mysh
}

build() {
  cd ${srcdir}
  cmake -G Ninja -B build
  cd build
  ninja
}
