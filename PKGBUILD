# Maintainer: yjun <jerrysteve1101 at gmail dot com>

pkgname=uboot-mdb-dump-git
_gitname=uboot-mdb-dump
pkgver=r4.efb0157
pkgrel=1
pkgdesc="a small script hacked together to convert a memory dump obtained by md.b in U-Boot via a serial console to binary form."
arch=('any')
url="https://github.com/gmbnomis/uboot-mdb-dump"
license=('GPL')
depends=('python3')
provides=("${_gitname}")
conflicts=("${_gitname}")
source=(${pkgname}::"git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  cd "$pkgname"

  install -Dm755 uboot_mdb_to_image.py -t ${pkgdir}/usr/bin/
  ln -sf /usr/bin/uboot_mdb_to_image.py ${pkgdir}/usr/bin/uboot_mdb_to_image
}

# vim: set sw=2 ts=2 et:
