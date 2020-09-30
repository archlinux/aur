# Maintainer: dec05eba <dec05eba@protonmail.com>

pkgname=sibs-git
pkgver=r280.228e5f9
pkgrel=1
pkgdesc='A simple cross-platform build system and package manager for c, c++ and zig. Inspired by rusts cargo'
arch=('x86_64')
url="https://git.dec05eba.com/sibs"
license=('GPL3')
depends=('curl' 'libarchive' 'libgit2' 'ninja' 'cmake' 'ccache' 'util-linux')
provides=('sibs')
conflicts=('sibs')
source=("${pkgname}-${pkgver}.tar.gz::https://dec05eba.com/snapshot/sibs.git.tar.gz")
sha512sums=('bfdc6b3bb858e010462f9a29a73423db8939ba762bd40d86ac89a2f1eb1099aaa77c3f13098b64e40319bb9ad1a73898677fdf208fb4a55ba59cf599bf3cd4f0')

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
