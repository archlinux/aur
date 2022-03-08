# Maintainer: Gnarflord <aur@gnarf.link>
pkgname=bakelite
pkgver=r91.3739017
pkgrel=1
pkgdesc="Incremental backup with strong cryptographic confidentiality baked into the data model"
arch=('x86_64')
url="https://github.com/richfelker/bakelite"
license=('GPL2')
source=("git+https://github.com/richfelker/bakelite.git#branch=main")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$pkgname"

  make
}

package() {
  cd "$pkgname"

  install -D bakelite "$pkgdir/usr/bin/bakelite"
}
