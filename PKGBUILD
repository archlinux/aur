# Maintainer: bgme <i@bgme.me>

pkgname=zdns-git
pkgdesc='A command-line utility that provides high-speed DNS lookups.'
pkgver=1.0.0.327.d659a36
pkgrel=1
url='https://github.com/zmap/zdns'
arch=('x86_64')
license=('Apache')
depends=('glibc')
makedepends=('git' 'go')
provides=('zdns')
source=(${pkgname}::git+https://github.com/zmap/zdns.git)
sha512sums=('SKIP')

pkgver() {
  cd ${pkgname}
  printf "%s.%s.%s" \
    "$(git tag -l|cut -d- -f1|sort -V -r|head -n1|cut -dv -f2)" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

build() {
  cd ${pkgname}
  make
}

package() {
  install -D "${pkgname}/zdns" "${pkgdir}/usr/bin/zdns"
}
