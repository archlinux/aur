# Maintainer:  AImixAE <AImixAE@outlook.com>

pkgname="mysh-git"
pkgver="1.1"
pkgrel="1"
pkgdesc=" This is My Shell"
arch=("any")
url="https://github.com/AImixAE/mysh"
makedepends=("patchelf" "gcc" "cmake" "ninja")
# source=("git+https://ghproxy.cn/https://github.com/AImixAE/mysh.git")
source=("git+https://github.com/AImixAE/mysh.git")
sha512sums=("SKIP")

build() {
  cd ${srcdir}/mysh
  cmake -G Ninja -B build
  cd build
  ninja
}

check() {
  if [[ ! -f ${srcdir}/mysh/build/main ]]; then
    exit 1
  fi
}

package() {
  install -D ${srcdir}/mysh/build/main ${pkgdir}/usr/bin/mysh
  install -D ${srcdir}/mysh/build/lib*.so -t ${pkgdir}/usr/lib/mysh
  patchelf --set-rpath /usr/lib/mysh ${pkgdir}/usr/bin/mysh
}
