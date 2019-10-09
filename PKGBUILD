# Maintainer: L. Bradley LaBoon <me@bradleylaboon.com>
pkgname=splunkforwarder
basever=7.3.2
splunkver=${basever}-c60db69f8e32
# Splunk is inconsistent with the length of their version numbers
if [ ${#basever} -gt 5 ]; then
	pkgver=${basever}
else
	pkgver=${basever}.0
fi
pkgrel=1
epoch=3
pkgdesc="Splunk Universal Forwarder"
url="https://www.splunk.com/"
arch=('x86_64' 'armv6h' 'armv7h')
license=('custom')
conflicts=('splunk')
install="$pkgname.install"
source=("$pkgname.service")
source_x86_64=("https://download.splunk.com/products/universalforwarder/releases/$basever/linux/$pkgname-$splunkver-Linux-x86_64.tgz")
source_armv6h=("https://download.splunk.com/products/universalforwarder/releases/$basever/linux/$pkgname-$splunkver-Linux-arm.tgz")
source_armv7h=("https://download.splunk.com/products/universalforwarder/releases/$basever/linux/$pkgname-$splunkver-Linux-arm.tgz")
sha256sums=('8bd6b2bcf9e9d89d3ab2160c409687313bbee00b7e44b3df3266b44d15a5c152')
sha256sums_x86_64=('04e02b321dd27cc721adbe01afb899bbda5cd62edc071aae9cbfaa0109de0080')
sha256sums_armv6h=('1f2237d9a95da5ebc902479173b76e2f3ff697a5dd459102d554073667c42d30')
sha256sums_armv7h=('1f2237d9a95da5ebc902479173b76e2f3ff697a5dd459102d554073667c42d30')

package() {
	cd "$srcdir"
	install -Dm644 "$pkgname/license-eula.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
	mkdir "$pkgdir/opt"
	cp -r "$pkgname" "$pkgdir/opt/"
}
