# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=pkgoutofdate
pkgver=r11.8725288
pkgrel=1
pkgdesc='Checks whether Arch packages are out-of-date'
arch=(any)
url='https://github.com/anatol/pkgoutofdate'
license=(GPL3)
depends=(ruby)
makedepends=(git)
source=("git+https://github.com/anatol/pkgoutofdate#commit=872528870ef3cf6654bcf42d7c42e7e705cd538b")
conflicts=('pkgoutofdate-git')
provides=('pkgoutofdate-git')
sha1sums=('SKIP')

pkgver() {
  cd pkgoutofdate
  # repo does not have any git tags yet
  echo r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  cd pkgoutofdate
  sed -i 's|./parse_pkgbuild.sh|/usr/share/pkgoutofdate/parse_pkgbuild.sh|' pkgoutofdate.rb
}

package() {
  cd pkgoutofdate

  install -d "$pkgdir/usr/bin" "$pkgdir/usr/share/pkgoutofdate"
  install -m755 -T pkgoutofdate.rb "$pkgdir/usr/bin/pkgoutofdate"
  install -m755 -t "$pkgdir/usr/share/pkgoutofdate" parse_pkgbuild.sh
}
