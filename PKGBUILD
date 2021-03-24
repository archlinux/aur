# Maintainer: L. Bradley LaBoon <me@bradleylaboon.com>
pkgname=splunk
basever=8.1.3
splunkver=${basever}-63079c59e632
# Splunk is inconsistent with the length of their version numbers
if [ ${#basever} -gt 5 ]; then
	pkgver=${basever}
else
	pkgver=${basever}.0
fi
pkgrel=1
epoch=3
pkgdesc="Statistical analysis and search tool for logs and machine data"
url="https://www.splunk.com/"
arch=('x86_64')
license=('custom')
install="$pkgname.install"
source=("$pkgname.service")
source_x86_64=("https://download.splunk.com/products/splunk/releases/$basever/linux/$pkgname-$splunkver-Linux-x86_64.tgz")
sha256sums=('ca96b85750a0592208facc747bbe1eb22b0a35b6dee841e6f51f1ad6a9157757')
sha256sums_x86_64=('b191a7a1c2eeb23e8b0331c04c8d1f3ab2b854ca3a45c31b8bf52dd81084afdc')
options=(!strip)

package() {
	cd "$srcdir"
	install -Dm644 "$pkgname/license-eula.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
	mkdir "$pkgdir/opt"
	cp -r "$pkgname" "$pkgdir/opt/"
}
