pkgname=gamepadla-polling
pkgver=1.3.1.4
pkgrel=1
pkgdesc="Gamepads latency and polling rate tester (XinputTest analog)"
url="https://github.com/cakama3a/Polling"
depends=('python>=3.10' 'python-requests' 'python-numpy' 'python-colorama' 'python-pygame')
license=('MIT')
arch=('any')
_commitish=refs/tags/$pkgver
_dirname=Polling-$(echo "${_commitish}" | awk -F/ '{print $NF}')
source=("$pkgname-$pkgver.tar.gz::$url/archive/${_commitish}.tar.gz"
	"gamepadla-polling.desktop")
sha256sums=('59fe15653ced99cf6c4007f2aea316e9b583e0a6897931878ce901040e7f3bc2'
	'SKIP')

build() {
	cd "$_dirname"
	sed -i '1s|^|#!/usr/bin/env python3\n|' Python.py
	chmod +x Python.py
}

package() {
	install -Dm644 gamepadla-polling.desktop -t "$pkgdir"/usr/share/applications/
	cd "$_dirname"
	install -Dm755 Python.py "$pkgdir"/usr/bin/$pkgname
	install -Dm644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
	install -Dm644 README.md -t "$pkgdir"/usr/share/doc/$pkgname/
	install -Dm644 icon.png "$pkgdir"/usr/share/icons/$pkgname.png
}
