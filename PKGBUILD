# Maintainer: mindhunter <mindhunter@blinkenshell.org>

pkgname="dark-send"
pkgver=1.2.1
pkgrel=2
pkgdesc="CLI Telegram client written in python"
arch=('x86_64')
url="https://github.com/mindhuntr/dark-send"
license=('GPL')
depends=('python-telethon' 'python-hachoir' 'python-tqdm' 'python-inquirerpy')
makedepends=('python-build' 'python-installer' 'python-wheel')
install=dark-send.install
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/d/dark-send/dark_send-${pkgver}.tar.gz")
sha256sums=('09eeb3dd89709e20652a637a77c3a21e58921631a99ebbfbbd20f4915aec3e30')

build() {
	cd "dark_send-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "dark_send-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm 644 ../../dark-send.service "${pkgdir}"/usr/lib/systemd/user/dark-send.service
}
