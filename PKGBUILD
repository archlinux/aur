# Maintainer: dasbd72 <twbd723@gmail.com>
pkgname=qemu-windows-launcher
pkgver=0.1.0
pkgrel=1
pkgdesc="Interactive launcher for a Windows drive in a QEMU/KVM VM"
arch=('any')
url="https://github.com/dasbd72/qemu-windows-launcher"
license=('MIT')
depends=('python' 'qemu-desktop' 'edk2-ovmf' 'sudo')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-hatchling')
provides=('qemu-windows-launcher')
source=("$pkgname::git+https://github.com/dasbd72/qemu-windows-launcher.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
	cd "$pkgname"
	python -m build --wheel --no-isolation
}

package() {
	cd "$pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
