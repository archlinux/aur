# Maintainer: Szymon Niedzwiedz <git at hardcoded dot info>

pkgname=proxydev
pkgver=0.9.6
pkgrel=1
pkgdesc="Creates evdev proxy device for QEMU"
arch=('x86_64')
provides=('proxydev')
conflicts=('proxydev')
url="https://gitlab.com/b1gbear/proxydev"
license=('GPL3')
requires=('libevdev', 'systemd-libs')
source=("git+https://gitlab.com/b1gbear/proxydev.git#tag=8220ddb856b74eacc938e7974294cf3845ff7fe4")
sha256sums=('SKIP')

build() {
  cd $pkgname
  make all
}

package() {
    cd $pkgname

    install -d ${pkgdir}/etc/proxydev/
	install -d ${pkgdir}/etc/udev/rules.d/
	install -d ${pkgdir}/usr/bin
	install -d ${pkgdir}/usr/lib/systemd/system/
	install -d ${pkgdir}/etc/systemd/system/

	install -m 644 pkg/etc/udev/rules.d/80-proxydev.rules ${pkgdir}/etc/udev/rules.d/80-proxydev.rules
	install -m 644 pkg/etc/proxydev/config.toml.example ${pkgdir}/etc/proxydev/config.toml.example
	install -m 644 pkg/usr/lib/systemd/system/proxydev.service ${pkgdir}/usr/lib/systemd/system/proxydev.service

	install out/proxydev ${pkgdir}/usr/bin/proxydev
}
