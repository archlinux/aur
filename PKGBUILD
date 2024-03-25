# Maintainer: L. Bradley LaBoon <brad@laboon.io>
pkgname=splunkforwarder
basever=9.2.0.1
splunkver=${basever}-d8ae995bf219
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
source_x86_64=("https://download.splunk.com/products/universalforwarder/releases/$basever/linux/$pkgname-$splunkver-Linux-x86_64.tgz")
source_aarch64=("https://download.splunk.com/products/universalforwarder/releases/$basever/linux/$pkgname-$splunkver-Linux-armv8.tgz")
sha256sums=('a2e28b83efc9a390c490ae26f991eee99d7e122c6278b581b457c8b81757a9bc'
            '27d1d172add8c64a275ec3356f0fa0b9d56036a7e64b7b882e066a67f6173b5b'
            'bca1b7720a827973f1c959cb78d788324f47dd6fcfc03bf4452c457f2d044db5')
sha256sums_x86_64=('ae61d98847a7a9d694444b69c6046c1dce4074a249c0b4e865eb2c46d36909cd')
sha256sums_aarch64=('aecc2a1f633a19191cb8c661492fffd05a0961fb3f368b27e6e7a8db91b9b85c')

package() {
	cd "$srcdir"
	install -vDm 644 ${pkgname}.sysusers "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
	install -vDm 644 ${pkgname}.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
	install -Dm644 "$pkgname/license-eula.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
	mkdir "$pkgdir/opt"
	cp -r "$pkgname" "$pkgdir/opt/"
}
