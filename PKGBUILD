# Maintainer: Christian Zangl <laktak@cdak.net>
pkgname=nofan
pkgver=1.0.0
pkgrel=1
pkgdesc="(No)fan controller for the Framework 16"
arch=('x86_64')
url="https://github.com/laktak/nofan"
license=('MIT')
depends=('fw-ectool-git')
makedepends=(git go)
source=(nofan.tar.gz)
provides=(nofan)
source=("$pkgname-$pkgver::git+$url")
sha256sums=('SKIP')

prepare() {
	cd "$pkgname-$pkgver"
	git checkout "v$pkgver"
}

build() {
	cd "$pkgname-$pkgver"
	scripts/build
}

package() {
	cd "$pkgname-$pkgver"

  install -Dm755 nofan "$pkgdir/usr/bin/nofan"

  # systemd service
  install -Dm644 systemd/nofan.service "$pkgdir/usr/lib/systemd/system/nofan.service"

  # tmpfiles configuration
  install -Dm644 systemd/tmpfiles.conf "$pkgdir/usr/lib/tmpfiles.d/nofan.conf"

  # sleep configuration
  install -Dm644 systemd/on_sleep "$pkgdir/usr/lib/systemd/system-sleep/nofan"
}
