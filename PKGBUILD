# Maintainer: mindhunter <mindhunter@blinkenshell.org>

pkgname="dark-send"
pkgver=1.3.0
pkgrel=1
pkgdesc="CLI Telegram client written in python"
arch=('x86_64')
url="https://github.com/mindhuntr/dark-send"
license=('GPL')
depends=('python-telethon' 'python-hachoir' 'python-tqdm' 'python-inquirerpy' 'python-rich')
makedepends=('python-build' 'python-installer' 'python-wheel')
install=dark-send.install
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/d/dark-send/dark_send-${pkgver}.tar.gz")
sha256sums=('abeba58ca28741670c4c52f11f9dfbfb849d65ff2a4c8d269d3808dfcc087734')

build() {
	cd "dark_send-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "dark_send-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm 644 ../../dark-send.service "${pkgdir}"/usr/lib/systemd/user/dark-send.service
}
