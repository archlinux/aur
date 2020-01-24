# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
# Contributor: Matthew McGinn <mamcgi@gmail.com>
_projectname='electron'
_pkgname="${_projectname}3"
pkgname="$_pkgname-bin"
pkgver='3.1.13'
pkgrel='5'
pkgdesc='Build cross platform desktop apps with web technologies - version 3 - binary version'
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://${_projectname}js.org/"
license=('MIT')
provides=("$_pkgname")
conflicts=("$_pkgname")
depends=('c-ares' 'ffmpeg' 'gtk3' 'http-parser' 'libevent' 'libxslt' 'libxss' 'minizip' 'nss' 'snappy')
optdepends=(
	'kde-cli-tools: file deletion support (kioclient5)'
	'trash-cli: file deletion support (trash-put)'
	"xdg-utils: open URLs with desktop's default (xdg-email, xdg-open)"
)
_releaseurl="https://github.com/$_projectname/$_projectname/releases/download/v$pkgver"
source_x86_64=(
	"$pkgname-chromedriver-$pkgver-$pkgrel-x86_64.zip::$_releaseurl/chromedriver-v$pkgver-linux-x64.zip"
	"$pkgname-$pkgver-$pkgrel-x86_64.zip::$_releaseurl/$_projectname-v$pkgver-linux-x64.zip"
)
source_i686=(
	"$pkgname-chromedriver-$pkgver-$pkgrel-i686.zip::$_releaseurl/chromedriver-v$pkgver-linux-ia32.zip"
	"$pkgname-$pkgver-$pkgrel-i686.zip::$_releaseurl/$_projectname-v$pkgver-linux-ia32.zip"
)
source_armv7h=(
	"$pkgname-chromedriver-$pkgver-$pkgrel-armv7h.zip::$_releaseurl/chromedriver-v$pkgver-linux-armv7l.zip"
	"$pkgname-$pkgver-$pkgrel-armv7h.zip::$_releaseurl/$_projectname-v$pkgver-linux-armv7l.zip"
)
source_aarch64=(
	"$pkgname-chromedriver-$pkgver-$pkgrel-aarch64.zip::$_releaseurl/chromedriver-v$pkgver-linux-arm64.zip"
	"$pkgname-$pkgver-$pkgrel-aarch64.zip::$_releaseurl/$_projectname-v$pkgver-linux-arm64.zip"
)
sha256sums_x86_64=('aaaa85c1e3b83b0c9c4337e8a8fd46fcae7be3a00c7bb8ca5dc48169c88e34f8'
                   '33ab34af83bd1063fb1581ad0fed6dc1120b6b5d1dba0a8db3164af3e95d55df')
sha256sums_i686=('03eea93b7a741c53de4d70a6d0aad817e76077ee607c3e5799ea88f8548b9116'
                 '43b046768e6189794097a8e11e81d305a9c3586685b2ac88b3e44a452ecb2012')
sha256sums_armv7h=('65a40ac17514b921565c5735d020dcad19320c08743b8a57ce59e869cb76763e'
                   '4a6f2dcb8d6055c15b2fb416a9172da9f1666147ab82a5b8448177112413fadf')
sha256sums_aarch64=('e07b521b78bf1b8a798cf182da7d69addd4df14be1ba1b94f6ac2b8def0eb64d'
                    'a81f64005de996950219b9da38f0c9299fb519a6f7a7b7c38868cd066c3fec8e')

package() {
	cd "$srcdir/"
	install -dm755 "$pkgdir/usr/lib/$_pkgname/"
	find . -mindepth 1 -maxdepth 1 -type f ! -name "*.zip" ! -name "LICENSE*" -exec cp -r --no-preserve=ownership --preserve=mode -t "$pkgdir/usr/lib/$_pkgname/." {} +
	cp -r --no-preserve=ownership --preserve=mode 'locales/' "$pkgdir/usr/lib/$_pkgname/locales/"
	cp -r --no-preserve=ownership --preserve=mode 'resources/' "$pkgdir/usr/lib/$_pkgname/resources/"

	install -dm755 "$pkgdir/usr/bin"
	ln -nfs "/usr/lib/$_pkgname/electron" "$pkgdir/usr/bin/$_pkgname"

	install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 'LICENSES.chromium.html' "$pkgdir/usr/share/licenses/$pkgname/LICENSES.chromium.html"
}
