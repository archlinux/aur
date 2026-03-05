# Maintainer: L. Bradley LaBoon <brad@laboon.io>
pkgname=splunkforwarder
_basever=10.2.1
_baseverl=${_basever//[^.]}
_splunkver=${_basever}-c892b66d163d
# Splunk is inconsistent with the length of their version numbers
if [ ${#_baseverl} -gt 2 ]; then
	pkgver=${_basever}
else
	pkgver=${_basever}.0
fi
pkgrel=2
epoch=3
pkgdesc="Splunk Universal Forwarder"
url="https://www.splunk.com/"
arch=('x86_64' 'aarch64')
license=('custom')
conflicts=('splunk')
install="$pkgname.install"
source=("$pkgname.service" "$pkgname.sysusers" "$pkgname.tmpfiles")
source_x86_64=("https://download.splunk.com/products/universalforwarder/releases/${_basever}/linux/$pkgname-${_splunkver}-linux-amd64.tgz")
source_aarch64=("https://download.splunk.com/products/universalforwarder/releases/${_basever}/linux/$pkgname-${_splunkver}-linux-arm64.tgz")
sha256sums=('a2e28b83efc9a390c490ae26f991eee99d7e122c6278b581b457c8b81757a9bc'
            '27d1d172add8c64a275ec3356f0fa0b9d56036a7e64b7b882e066a67f6173b5b'
            'bca1b7720a827973f1c959cb78d788324f47dd6fcfc03bf4452c457f2d044db5')
sha256sums_x86_64=('c85663bba7522892bee5572c97f72c4ccda5de636e838a063759403f7a385ff6')
sha256sums_aarch64=('e9693f3efb95071ca21635719fd364e09169f429c18f358adb78847325cd1669')
options=(!strip libtool staticlibs !zipman)

package() {
	cd "$srcdir"
	install -vDm 644 ${pkgname}.sysusers "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
	install -vDm 644 ${pkgname}.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
	install -Dm644 "$pkgname/license-eula.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
	mkdir "$pkgdir/opt"
	cp -r "$pkgname" "$pkgdir/opt/"
}
