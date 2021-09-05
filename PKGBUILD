# Maintainer: Leon Schumacher <leonsch@protonmail.com>
# vim: ft=sh:
pkgname=systemd-libs-fake-bin
pkgver=249.4
pkgrel=1
pkgdesc="Fake systemd client libraries without libudev - real binaries"
arch=('x86_64')
url="https://www.github.com/systemd/systemd"
license=('LGPL2.1')
depends=('glibc' 'libcap' 'libgcrypt' 'libp11-kit' 'lz4' 'xz' 'zstd')
makedepends=('arch-package-download')
provides=('systemd-libs-fake' 'systemd-libs' 'libsystemd' 'libsystemd.so')
conflicts=('systemd-libs-fake' 'systemd-libs' 'libsystemd')

package() {
	arch-package-download systemd-libs
	tar xf systemd-libs-*.tar.zst
	cd usr/lib
	install -d "$pkgdir/usr/lib"
	for i in *; do
		case "$i" in libudev*) continue ;; esac
		cp -P "$i" "$pkgdir/usr/lib/"
	done
}
