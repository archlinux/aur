# Maintainer: Levente Polyak <levente[at]leventepolyak[dot]net>

pkgname=nsoq-git
pkgver=1.9.5.31.494143a
pkgrel=1
pkgdesc="Network Security Tool for packet manipulation that allows a large number of options"
url="http://www.nsoq.org/"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
license=('GPL3')
depends=('glibc')
makedepends=('git')
provides=('nsoq')
conflicts=('nsoq')
source=(${pkgname}::git+https://github.com/FelipeEcker/nsoq)
sha512sums=('SKIP')

pkgver() {
  cd ${pkgname}
  printf "%s.%s.%s" "$(git describe --tags --abbrev=0|cut -dv -f2)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${pkgname}
  make
}

package() {
  cd ${pkgname}
  install -Dm 755 bin/nsoq "${pkgdir}/usr/bin/nsoq"
  install -Dm 644 CHANGELOG README.md docs/nsoq.txt -t "${pkgdir}/usr/share/doc/nsoq"
  install -Dm 644 docs/nsoq.8.gz "${pkgdir}/usr/share/man/man8/nsoq.8.gz"
}

# vim: ts=2 sw=2 et:
