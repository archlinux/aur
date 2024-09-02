# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
# Contributor: Nicolas Pierson <nicolas.pierson@cornerside.fr>

pkgname=k380-function-keys-conf
pkgver=1.1
pkgrel=3
pkgdesc="Make function keys on Logitech K380 bluetooth keyboard default"
arch=(x86_64)
url=https://github.com/jergusg/k380-function-keys-conf
license=(GPL-3.0-only)
depends=(glibc)
install=$pkgname.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz" 80-k380.rules)
b2sums=('57acbbaff08efc765e125406e7a628cbac9b82dd168714b3d360aafb5390e71bddbeded4fe07c496fbde6ee8e5e57d1e7aad9530b1e747847457ad58021b38b0'
        'de6bf002983ea3f447055999ef9f5028fe34049ed0cf7b95a61304adf300ae1eed6ce9cf188f85f0622418b98753a2497918ef0a3accf9ca3657d506b072aa8b')

build() {
  cd "$pkgname-$pkgver"
  make k380_conf
}

package() {
  install -Dm0644 80-k380.rules "$pkgdir"/usr/lib/udev/rules.d/80-k380.rules
  cd "$pkgname-${pkgver}"
  install -Dm0755 k380_conf "$pkgdir"/usr/bin/k380_conf
}
