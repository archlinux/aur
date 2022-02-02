# Maintainer: Savely Krasovsky <savely@krasovs.ky>
pkgname=reform-tools
pkgver=1.0
pkgrel=8
pkgdesc="MNT Reform laptop tools"
arch=('x86_64' 'aarch64')
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
	'reform-sleep.service'
        'motd')
sha256sums=('0770f3d260913b7fed25f2e5043749c9b1879150fa8ea8d4e9ca674b26f571cc'
            'dd22f0111a044af4a1b03017616a20bed9863d65ffd90670d764b559daf207ed'
            '85a325247a4946c44fe01537756a0730a570c693944dda0f782c1d236adb419e'
            '30f643cbe65b0cdfca24326c68bce1a4e8a66c39aad3a81deec1c9532f7e4914')

prepare() {
	cd reform-debian-packages-reform-tools-1.0-8/reform-tools_1.0-8
	rm -rf etc/apt
	mv lib usr/
	mv sbin/* usr/bin
	rm -r sbin
	mv usr/sbin/* usr/bin/
	rm -r usr/sbin
}

package() {
	cd reform-debian-packages-reform-tools-1.0-8/reform-tools_1.0-8
	cp -dr --no-preserve=ownership {etc,usr} $pkgdir/

	install -Dm644 "$srcdir"/motd -t "$pkgdir"/etc
	install -Dm644 "$srcdir"/reform-hw-setup.service -t "$pkgdir"/usr/lib/systemd/system
        install -Dm644 "$srcdir"/reform-sleep.service -t "$pkgdir"/usr/lib/systemd/system
}
