# Maintainer: L. Bradley LaBoon <brad@laboon.io>
pkgname=splunk
_basever=10.0.1
_baseverl=${_basever//[^.]}
_splunkver=${_basever}-c486717c322b
# Splunk is inconsistent with the length of their version numbers
if [ ${#_baseverl} -gt 2 ]; then
	pkgver=${_basever}
else
	pkgver=${_basever}.0
fi
pkgrel=1
epoch=3
pkgdesc="Statistical analysis and search tool for logs and machine data"
url="https://www.splunk.com/"
arch=('x86_64')
license=('custom')
install="$pkgname.install"
source=("$pkgname.service" "$pkgname.sysusers" "$pkgname.tmpfiles")
source_x86_64=("https://download.splunk.com/products/splunk/releases/${_basever}/linux/$pkgname-${_splunkver}-linux-amd64.tgz")
sha256sums=('b6e93690f033416fd765fd7cb97147a1872c3f5ecc3dad13714d83f765c6291e'
            '236deb352218f9551df894efd613aad201afb20713ac563ab381f68b6ffce853'
            '56b70a2395270fc038987241504df11c390f3234d5be640bbc6a311b978e8475')
sha256sums_x86_64=('011db463114f8ef8339a982e1770a7083d1364b4a6de8b681eac7f3dd1971c34')
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
