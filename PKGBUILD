# Maintainer: Mark Collins <tera_1225 hat hotmail.com>

pkgname=reboot-guard
pkgver=1.0.1
pkgrel=1
pkgdesc="Block systemd-initiated poweroff/reboot/halt until configurable condition checks pass"
arch=('any')
url="https://github.com/ryran/reboot-guard"
license=('GPL')
depends=('python' 'systemd')
provides=('rguard')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ryran/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('75e2fcf51057b043163efcc0e35cbfbd')

prepare() {
  cd "$pkgname-$pkgver"
  sed -ie 's#/usr/sbin/#/usr/bin/#' rguard.service
}

package() {
	cd "$pkgname-$pkgver"
	mkdir -p "${pkgdir}/usr/bin/"
	install -D rguard "${pkgdir}/usr/bin/"
	mkdir -p "$pkgdir/etc/systemd/system/"
	install -D rguard.service "$pkgdir/etc/systemd/system/"
}
