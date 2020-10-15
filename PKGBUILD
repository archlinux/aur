# Maintainer: dec05eba <dec05eba@protonmail.com>

pkgname=sibs-git
pkgver=r281.8a923ca
pkgrel=1
pkgdesc='A simple cross-platform build system and package manager for c, c++ and zig. Inspired by rusts cargo'
arch=('x86_64')
url="https://git.dec05eba.com/sibs"
license=('GPL3')
depends=('curl' 'libarchive' 'libgit2' 'ninja' 'cmake' 'ccache' 'util-linux')
provides=('sibs')
conflicts=('sibs')
source=("${pkgname}-${pkgver}.tar.gz::https://dec05eba.com/snapshot/sibs.git.tar.gz")
sha512sums=('13d52c094f9db112bc67d6259a6f1f85d1b54eef66cc0ffa8ace0b1ac8054ed3e23670c37ab7edc0fc22eec9e6dc23dc85288450785ca020332a6f44218567f8')

build() {
  cd "$srcdir/cmake"
  mkdir release
  cd release
  cmake -G Ninja -DCMAKE_BUILD_TYPE=Release ../../
  ninja
}

package() {
  cd "$srcdir/cmake/release"
  install -Dm755 sibs "$pkgdir/usr/bin/sibs"
}
