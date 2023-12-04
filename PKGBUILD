# Maintainer: Mark Collins <tera_1225 hat hotmail.com>

pkgname=reboot-guard
pkgver=1.0.1
pkgrel=5
pkgdesc="Block systemd-initiated poweroff/reboot/halt until configurable condition checks pass"
arch=('any')
url="https://github.com/ryran/reboot-guard"
license=('GPL')
depends=('python' 'systemd')
provides=('rguard')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ryran/$pkgname/archive/v$pkgver.tar.gz"
    "reboot-guard-python3.patch")
md5sums=('75e2fcf51057b043163efcc0e35cbfbd'
         'abdfb0be41bd2fad42bc4fc3040c573a')

prepare() {
  cd "$pkgname-$pkgver"
  sed -ie 's#/usr/sbin/#/usr/bin/#' rguard.service
  patch -i "${srcdir}/reboot-guard-python3.patch"
}

package() {
	cd "$pkgname-$pkgver"
	mkdir -p "${pkgdir}/usr/bin/"
	install -D -m 755 rguard "${pkgdir}/usr/bin/"
	mkdir -p "$pkgdir/usr/lib/systemd/system/"
	install -D -m 644 rguard.service "$pkgdir/usr/lib/systemd/system/"
}
