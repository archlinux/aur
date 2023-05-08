# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=pkgoutofdate-git
pkgver=r20.f47f22c
pkgrel=1
pkgdesc='Checks whether Arch packages are out-of-date'
arch=(any)
url='https://github.com/anatol/pkgoutofdate'
license=(GPL3)
depends=(ruby)
makedepends=(git)
source=(git+https://github.com/anatol/pkgoutofdate)
sha1sums=('SKIP')

pkgver() {
  cd pkgoutofdate
  # repo does not have any git tags yet
  echo r$(git rev-list --count master).$(git rev-parse --short master)
}

prepare() {
  cd pkgoutofdate
  sed -i 's|#{CURRENT_DIR}/parse_pkgbuild.sh|/usr/share/pkgoutofdate/parse_pkgbuild.sh|' pkgoutofdate.rb
}

package() {
  cd pkgoutofdate

  install -d "$pkgdir/usr/bin" "$pkgdir/usr/share/pkgoutofdate"
  install -m755 -T pkgoutofdate.rb "$pkgdir/usr/bin/pkgoutofdate"
  install -m755 -t "$pkgdir/usr/share/pkgoutofdate" parse_pkgbuild.sh
}
