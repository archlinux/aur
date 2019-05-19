# Maintainer: Alfin Bakhtiar Ilhami <alfin at nuclea dot id>

pkgname=marktext-bin
_pkgname=marktext
pkgver=0.14.0
pkgrel=3
pkgdesc='A simple and elegant open-source markdown editor that focused on speed and usability.'
arch=('x86_64')
url='https://marktext.app'
license=('MIT')
provides=('marktext')
conflicts=('marktext')
depends=('gtk3' 'libxss' 'nss')

_source() {
	local _github=https://github.com/marktext/marktext

	# Binary tarball
	echo $pkgname-$pkgver.tar.gz::$_github/releases/download/v$pkgver/$_pkgname-$pkgver-x64.tar.gz

	# Desktop entry
	echo $pkgname-$pkgver.desktop::$_github/raw/v$pkgver/resources/linux/$_pkgname.desktop

	# Icons
	for s in 16 24 32 48 64 128 256 512; do
		echo $pkgname-${s}x${s}.png::$_github/raw/v$pkgver/resources/icons/${s}x${s}/$_pkgname.png
	done
}
source=($(_source))

prepare() {
	# Change desktop entry to execute /usr/lib/marktext/marktext
	sed -i "s|Exec=.*|Exec=/usr/lib/marktext/marktext %F|" \
		"$srcdir/$pkgname-$pkgver.desktop"
}

package() {
	install -d "$pkgdir/usr/lib"
	cp -rT "$srcdir/$_pkgname-$pkgver-x64" "$pkgdir/usr/lib/$_pkgname"

	# Install desktop entry
	install -Dm644 "$srcdir/$pkgname-$pkgver.desktop" \
		"$pkgdir/usr/share/applications/$_pkgname.desktop"

	# Install icons
	for s in 16 24 32 48 64 128 256 512; do
		install -Dm644 "$srcdir/$pkgname-${s}x${s}.png" \
			"$pkgdir/usr/share/icons/hicolor/${s}x${s}/apps/$_pkgname.png"
	done

	# Install licenses
	install -Dt "$pkgdir/usr/share/licenses/$_pkgname" -m644 \
		"$srcdir/$_pkgname-$pkgver-x64/"{LICENSE,LICENSE.electron.txt,LICENSES.chromium.html}
}

sha512sums=('8e485ac0c599d149ab4a04666b8ba58f77c5576d2cf70b5e81d2748d69b3c9d79a92ca9b3d3d7ea6d643f7ef12145ccd4c3a8f093436962161fd73c9704e6ae3'
            '98886b39342ca90fe1c2ff011e612e62c37cba589cd1f8ee71dc8d6df7db1582798cef844cfc6ab50e29f5f2e21edc2a16c88b480298cfd719058e47ff754982'
            '2d700fb2af037ade7c66e328e90eacfec27fe25d3ee42487f00978450a81bc9275622404cad821a41b4f5a767d9f7afbbe614ed7a0ddbc95d879fb57beef79e2'
            '52a8a7f28f620738e06253243e3156d09bc6f9cec6ab49caa2e3674e57be0378d5ab6bc28028ee08caaebd7b197c383ed5f08a5c1c8cb9dce6c9b1c90abb932e'
            '840ec0fc95ebeff29902d984113b91906ca5c3fc598fdd515a9b475a373d0c96bcee0c6bb146c8e99ccef2c616db0ee1ddfc44573d78ce9077b4bc2fab1c41e8'
            '39ee566a087950b88c165903ee00a86ab6f6c7fe9c86d715fdc87af144e47b06713f604e10ff09c0d9dde5a62a160376e20657a5d1dcb68d1b1901f976741336'
            '9bd243eda4888d8ae15991d9595d1dcf7992c00b4193406b7cc7e74ae86c1afcd1948979710494b65d504807a9393edd6c01ff3125776ebf5eb3061f29b57dd4'
            '7b2a5ee74bbc24e10940ac7ef0bf82f9d73c7d981f8d5a90bb58fc857a417176d69a77995b43eb696ddb0d237c11dccd4ae6ed337accc0a27ab54f1bcdc2064d'
            '3461f1c9cb29e103861101dc3ed0c6f24536d99bab78182b12c296a09ce7a9d249620e9788526184311af761a994b846877c84161922a7d0a0355f178d1aa4fc'
            '2effb4e6be7f68f3c55b98c0d7c41a23bf4b1a5e9bf3d1544a5f642ef8764c63cb75bdc98b039278948dd21185899142fc688c6f70a3d38f8e6af54aefbda00c')
