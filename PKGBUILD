# Maintainer: L. Bradley LaBoon <me@bradleylaboon.com>
pkgname=splunk
basever=9.1.3
splunkver=${basever}-d95b3299fa65
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
source=("$pkgname.service" "$pkgname.sysusers" "$pkgname.tmpfiles")
source_x86_64=("https://download.splunk.com/products/splunk/releases/$basever/linux/$pkgname-$splunkver-Linux-x86_64.tgz")
sha256sums=('f4e831e3b281f1e677a3597fc85162cd347803ea3b41605f990347000e5caff9'
            '236deb352218f9551df894efd613aad201afb20713ac563ab381f68b6ffce853'
            '56b70a2395270fc038987241504df11c390f3234d5be640bbc6a311b978e8475')
sha256sums_x86_64=('bc57ed6197ea5dc411378b46377641d41ea8d18fc63f43ba7c7a6ed5888e4f69')
options=(!strip)

package() {
	cd "$srcdir"
	install -vDm 644 ${pkgname}.sysusers "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
	install -vDm 644 ${pkgname}.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
	install -Dm644 "$pkgname/license-eula.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
	mkdir "$pkgdir/opt"
	cp -r "$pkgname" "$pkgdir/opt/"
}
