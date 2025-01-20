# Maintainer:  AImixAE <AImixAE@outlook.com>

pkgname="mysh-gitproxy"
pkgver="1.1"
pkgrel="1"
pkgdesc=" This is My Shell"
arch=("any")
licence=("custom")
url="https://github.com/AImixAE/mysh"
makedepends=("git" "gcc" "cmake" "ninja" "patchelf")
source=("git+https://ghproxy.cn/https://github.com/AImixAE/mysh.git")
# source=("git+https://github.com/AImixAE/mysh.git")
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
  install -Dm644 ${srcdir}/mysh/build/main ${pkgdir}/usr/bin/mysh
  install -Dm644 ${srcdir}/mysh/build/lib*.so -t ${pkgdir}/usr/lib/mysh
  patchelf --set-rpath /usr/lib/mysh ${pkgdir}/usr/bin/mysh
}
