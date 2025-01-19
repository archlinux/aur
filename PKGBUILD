# Maintainer:  AImixAE <AImixAE@outlook.com>
# Contributor: AImixAE <AImixAE@outlook.com>

pkgname="mysh-git"
pkgver="1.0"
pkgrel="2"
pkgdesc=" This is My Shell"
arch=("any")
url="https://github.com/AImixAE/mysh"
makedepends=("patchelf" "gcc" "cmake" "ninja")
source=("git+https://ghproxy.cn/https://github.com/AImixAE/mysh.git")
sha512sums=("SKIP")

package() {
  install -D ${srcdir}/mysh/build/main ${pkgdir}/usr/bin/mysh
  install -D ${srcdir}/mysh/build/lib*.so -t ${pkgdir}/usr/lib/mysh
  patchelf --set-rpath /usr/lib/mysh ${pkgdir}/usr/bin/mysh
}

check() {
  if [[ ! -f ${srcdir}/mysh/build/main ]]; then
    exit 1
  fi
}

build() {
  cd ${srcdir}/mysh
  cmake -G Ninja -B build
  cd build
  ninja
}
