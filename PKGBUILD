# Maintainer: L. Bradley LaBoon <brad@laboon.io>
pkgname=splunkforwarder
basever=9.4.3
splunkver=${basever}-237ebbd22314
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
arch=('x86_64' 'aarch64')
license=('custom')
conflicts=('splunk')
install="$pkgname.install"
source=("$pkgname.service" "$pkgname.sysusers" "$pkgname.tmpfiles")
source_x86_64=("https://download.splunk.com/products/universalforwarder/releases/$basever/linux/$pkgname-$splunkver-linux-amd64.tgz")
source_aarch64=("https://download.splunk.com/products/universalforwarder/releases/$basever/linux/$pkgname-$splunkver-linux-arm64.tgz")
sha256sums=('a2e28b83efc9a390c490ae26f991eee99d7e122c6278b581b457c8b81757a9bc'
            '27d1d172add8c64a275ec3356f0fa0b9d56036a7e64b7b882e066a67f6173b5b'
            'bca1b7720a827973f1c959cb78d788324f47dd6fcfc03bf4452c457f2d044db5')
sha256sums_x86_64=('6f8576d3f6ceed6fdd136d0251c23d1f5abe00b9636a851f6a6f4c7c504aab06')
sha256sums_aarch64=('0b8d239dd9afc62103cb62fe6c69dcf81aa7e988eee4ed6df6912b009fa29aa9')

package() {
	cd "$srcdir"
	install -vDm 644 ${pkgname}.sysusers "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
	install -vDm 644 ${pkgname}.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
	install -Dm644 "$pkgname/license-eula.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
	mkdir "$pkgdir/opt"
	cp -r "$pkgname" "$pkgdir/opt/"
}
