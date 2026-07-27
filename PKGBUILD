# Maintainer: Sao-Hsuan Lin <twbd723@gmail.com>
pkgname=qemu-wtg-git
pkgver=r0.0000000
pkgrel=1
pkgdesc="Interactive launcher for a Windows-To-Go USB drive in a QEMU/KVM VM"
arch=('any')
url="https://github.com/dasbd72/qemu-wtg"
license=('MIT')
depends=('python' 'qemu-desktop' 'edk2-ovmf' 'sudo')
makedepends=('git')
provides=('qemu-wtg')
conflicts=('qemu-wtg')
source=("$pkgname::git+https://github.com/dasbd72/qemu-wtg.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/$pkgname"

	install -Dm755 bin/qemu-wtg "$pkgdir/usr/bin/qemu-wtg"

	install -d "$pkgdir/usr/lib/qemu-wtg"
	cp -r src/qemu_wtg "$pkgdir/usr/lib/qemu-wtg/qemu_wtg"

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
