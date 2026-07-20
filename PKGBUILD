# Maintainer: Leonid Lednev <leonidledn at gmail dot com>
pkgname="phpggc-git"
pkgver=r725.f8aebde
pkgrel=1
pkgdesc="PHP gadget chain generator"
arch=(any)
provides=('phpggc')
conflicts=('phpggc')
url="https://github.com/ambionics/phpggc"
license=('Apache-2.0')
depends=('php')
makedepends=('git')
source=("git+$url")
b2sums=('SKIP')

pkgver() {
  cd phpggc
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  cd phpggc
  install -d "$pkgdir/usr/bin"
  ln -s "/usr/lib/phpggc/phpggc" "$pkgdir/usr/bin/phpggc"
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
  install -Dm0644 -t "$pkgdir/usr/share/doc/phpggc" README.md
  install -d "$pkgdir/usr/lib/phpggc"
  for _item in phpggc lib gadgetchains; do
    cp -ar $_item "$pkgdir/usr/lib/phpggc"
  done
}

# vim: ts=2 sw=2 et:
