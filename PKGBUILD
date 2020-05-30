# Maintainer: Nicolas Pierson <nicolas.pierson@cornerside.fr>

pkgname=k380-function-keys-conf
pkgver=1.1
pkgrel=1
pkgdesc="Make function keys on Logitech K380 bluetooth keyboard default"
arch=('x86_64')
url=https://github.com/jergusg/k380-function-keys-conf
license=("GPL")
depends=(glibc sh)
makedepends=(git)
install=${pkgname}.install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/jergusg/k380-function-keys-conf/archive/v${pkgver}.tar.gz" 80-k380.rules)
sha256sums=(f2eed315a1996d461d9dfbbcc834d09a2d00c6aea2159fa2a5e6721182ce3fa7 068a9b25f8c4bedceec03d5352d49b423a17433e4b6114866946d31f48c51fa6)

build() {
  cd "$pkgname-${pkgver}"
  make k380_conf
}

package() {
  cd "$pkgname-${pkgver}"
  install -dm0755 "$pkgdir"/usr/bin
  install -Dm0755 k380_conf fn_on.sh "$pkgdir"/usr/bin
  install -dm0755 "$pkgdir"/etc/udev/rules.d
  install -Dm0644 ../../80-k380.rules "$pkgdir"/etc/udev/rules.d/80-k380.rules
}
