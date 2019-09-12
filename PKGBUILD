# Maintainer: Akatsuki <akiirui@outlook.com>
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: GONG Chen <chen dot sst at gmail dot com>

pkgname=rime-data
_gitname=plum
pkgver=r110.c286df2
pkgrel=1
pkgdesc="Rime schema repository from plum"
arch=('x86_64')
url="https://github.com/rime/plum/"
license=('GPL3')
makedepends=('git' 'librime')
provides=('librime-data' 'brise')
conflicts=('brise')
source=("git+https://github.com/rime/plum.git")
sha512sums=('SKIP')

pkgver() {
  cd "$_gitname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$_gitname"
  make all
  rime_deployer --build output
  rm output/user.yaml
}

package() {
  cd "$_gitname"
  make DESTDIR="$pkgdir" install
}
