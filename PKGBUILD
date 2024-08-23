# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
# Contributor: Nicolas Pierson <nicolas.pierson@cornerside.fr>

pkgname=k380-function-keys-conf
pkgver=1.1
pkgrel=2
pkgdesc="Make function keys on Logitech K380 bluetooth keyboard default"
arch=(x86_64)
url=https://github.com/jergusg/k380-function-keys-conf
license=(GPL-3.0-only)
depends=(glibc)
install=$pkgname.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz" 80-k380.rules)
b2sums=('57acbbaff08efc765e125406e7a628cbac9b82dd168714b3d360aafb5390e71bddbeded4fe07c496fbde6ee8e5e57d1e7aad9530b1e747847457ad58021b38b0'
        'e1b664ce07f53b8b7aca7a46c3d791f5e956f5d83d3f5c2910b1d4afcab13b7a9a88eab95dbf647242cd544486c2e18e1aaab1e3f516104bdd5fc58f0226514f')

build() {
  cd "$pkgname-$pkgver"
  make k380_conf
}

package() {
  install -Dm0644 80-k380.rules "$pkgdir"/usr/lib/udev/rules.d/80-k380.rules
  cd "$pkgname-${pkgver}"
  install -Dm0755 k380_conf "$pkgdir"/usr/bin/k380_conf
}
