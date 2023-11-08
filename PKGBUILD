# Maintainer: Szymon Niedzwiedz <git at hardcoded dot info>

pkgname=proxydev
pkgver=0.9.5
pkgrel=1
pkgdesc="Creates evdev proxy device for QEMU"
arch=('x86_64')
provides=('proxydev')
conflicts=('proxydev')
url="https://gitlab.com/b1gbear/proxydev"
license=('GPL3')
requires=('libevdev', 'systemd-libs')
source=("git+https://gitlab.com/b1gbear/proxydev.git#tag=9606ca52f04ab2d872ed972493fbbaa201d15a20")
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
