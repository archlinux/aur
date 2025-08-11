pkgname=gamepadla-polling
pkgver=1.3.1.1
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
sha256sums=('cecbcbfbd1e187fdae34e5018e3888933636cc73ccee3317769bde60d0a7ff19'
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
