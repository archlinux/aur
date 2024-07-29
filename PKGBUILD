# Maintainer: SysAdm <sysadm.archlinux@proton.me>
# Contributor: Asuka Minato
pkgname=caido-desktop
pkgver=0.39.0
pkgrel=2
pkgdesc="A lightweight web security auditing toolkit."
arch=('x86_64')
url="https://caido.io/"
license=('private')
depends=(glibc gcc-libs)
provides=(caido)
source=("https://storage.googleapis.com/caido-releases/v${pkgver}/caido-desktop-v${pkgver}-linux-x86_64.AppImage")
sha256sums=('29841c936f9860f2c93772faa9c85a723c95cb25d1de79890d35f918f0785af2')

prepare() {
	chmod +x *.AppImage
	./*.AppImage --appimage-extract
	mv squashfs-root/* ./
	rm -rf ./usr/{lib,share/glib-2.0}
	find ./usr/bin -type f ! -name 'caido' -exec rm -f {} +
}

package() {
	cp -av usr $pkgdir/
}
