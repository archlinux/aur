# Maintainer: Savely Krasovsky <savely@krasovs.ky>
pkgname=reform-tools
pkgver=1.0
pkgrel=8
pkgdesc="MNT Reform laptop tools"
arch=('aarch64')
url="https://mntre.com/reform2/handbook/index.html"
license=('GPL3')
depends=('python'
	'python-psutil'
	'rsync'
	'alsa-utils'
	'systemd'
	'net-tools'
	'pavucontrol'
	'procps-ng'
	'busybox')
makedepends=('git')
source=("$pkgname-$pkgver.tar.gz::https://source.mnt.re/reform/reform-debian-packages/-/archive/reform-tools-1.0-8/reform-debian-packages-reform-tools-1.0-8.tar.gz"
        'reform-hw-setup.service'
	'reform-sleep.service')
sha256sums=('0770f3d260913b7fed25f2e5043749c9b1879150fa8ea8d4e9ca674b26f571cc')

prepare() {
	cd reform-debian-packages-reform-tools-1.0-8/reform-tools_1.0-8
	rm -rf etc/apt
}

package() {
	cd reform-debian-packages-reform-tools-1.0-8/reform-tools_1.0-8
	cp -dr --no-preserve=ownership {etc,lib,sbin,usr} $pkgdir

	install -Dm644 "$srcdir"/reform-hw-setup.service -t "$pkgdir"/usr/lib/systemd/system
        install -Dm644 "$srcdir"/reform-sleep.service -t "$pkgdir"/usr/lib/systemd/system
}
