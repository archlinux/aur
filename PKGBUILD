# Maintainer: Alexander Schmidt <alex@treefish.org>

pkgname=usetaglib-git
pkgver=r1.d02f0a1
pkgrel=1
pkgdesc="Command line utility to read and edit meta-data of audio formats supported by taglib."
arch=('i686' 'x86_64')
url="https://git.tree.fish/alex/usetaglib.git"
license=('GPL3')
source=('usetaglib-git::git+https://git.tree.fish/alex/usetaglib.git')
depends=('taglib>=1.9.1')
makedepends=('git' 'ca-certificates-cacert')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd $srcdir/$pkgname
  make
}

package() {
  install -Dm755 -t ${pkgdir}/usr/bin $srcdir/$pkgname/usetaglib
}
