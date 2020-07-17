# Maintainer: pallxk <aur@pallxk.com>
# Inspired by PKGBUILD of AUR package sencha-cmd-6

pkgname=sencha-cmd
pkgver=7.2.0.84
pkgrel=2
pkgdesc='Sencha Cmd provides a collection of powerful, time-saving features that work together and in conjunction with the Sencha Ext JS and Sencha Touch frameworks'
url='https://www.sencha.com/products/extjs/cmd-download/'
arch=('x86_64')
license=('custom')
depends=('java-runtime>=8' ruby fontconfig)
provides=(sencha-cmd-7)
conflicts=(sencha-cmd-5 sencha-cmd-6)
source=("https://cdn.sencha.com/cmd/$pkgver/no-jre/SenchaCmd-$pkgver-linux-amd64.sh.zip"
	"LICENSE")
sha512sums=(
	'10d4fe7104985ccd9181c21d55d40dba6e0db7a4b304f9d19917dd236b78e3ddd571a0c8f973aabc55b6a076606de6c81ca3b6eafbce91b72a946cf731d1d292'
	'fda827d9cae0859f37c4b588ae4e1ad3e8e5b6316d23f070691db566291d5a10d17c03934c90d17a9ed9a88a6b80be9e2f4c74fcb25112fe0a3fce3154495915'
)

prepare() {
	./SenchaCmd-$pkgver-linux-amd64.sh -q \
		-Dall=true \
		-V'addToPath$Integer'=1 \
		-dir "Sencha/Cmd/$pkgver"

	sed -i -e "s|$srcdir|/opt|g" Sencha/Cmd/$pkgver/.install4j/*
}

package() {
	install -d "$pkgdir/opt"
	cp -a Sencha "$pkgdir/opt"

	install -dm777 "$pkgdir/var/cache/$pkgname/repo"
	ln -s /var/cache/$pkgname/repo "$pkgdir/opt/Sencha/Cmd/repo"

	install -d "$pkgdir/usr/bin/"
	ln -s /opt/Sencha/Cmd/sencha "$pkgdir/usr/bin/sencha"

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
