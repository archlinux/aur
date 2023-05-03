# Contributor: Nicola Squartini <tensor5@gmail.com> (electron-launcher.sh script)
# Contributor: Matthew McGinn <mamcgi@gmail.com>
# Contributor: Asuka Minato

_projectname='electron'
_pkgname="${_projectname}2"
pkgname="$_pkgname-bin"
pkgver='2.0.18'
pkgrel='1'
pkgdesc='Build cross platform desktop apps with web technologies - version 2 - binary version'
arch=('x86_64' 'i686' 'pentium4' 'armv7h' 'aarch64')
url="https://${_projectname}js.org"
license=('MIT')
provides=("$_pkgname")
conflicts=("$_pkgname")
depends=('gconf' 'c-ares' 'ffmpeg' 'gtk3' 'http-parser' 'libevent' 'libxslt' 'libxss' 'minizip' 'nss' 'snappy')
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
source_pentium4=(
	"$pkgname-chromedriver-$pkgver-$pkgrel-pentium4.zip::$_releaseurl/chromedriver-v$pkgver-linux-ia32.zip"
	"$pkgname-$pkgver-$pkgrel-pentium4.zip::$_releaseurl/$_projectname-v$pkgver-linux-ia32.zip"
)
source_armv7h=(
	"$pkgname-chromedriver-$pkgver-$pkgrel-armv7h.zip::$_releaseurl/chromedriver-v$pkgver-linux-armv7l.zip"
	"$pkgname-$pkgver-$pkgrel-armv7h.zip::$_releaseurl/$_projectname-v$pkgver-linux-armv7l.zip"
)
source_aarch64=(
	"$pkgname-chromedriver-$pkgver-$pkgrel-aarch64.zip::$_releaseurl/chromedriver-v$pkgver-linux-arm64.zip"
	"$pkgname-$pkgver-$pkgrel-aarch64.zip::$_releaseurl/$_projectname-v$pkgver-linux-arm64.zip"
)
source=('electron-launcher.sh')
sha512sums=('e5ce4f292d5fff976efd6338c554b1dc62054ea13404154a35ef122bc655382bcd6de81fdf6936aa3cd2f1f4e7791d0fe4ae433f416ddb07b183ce7760c07b47')
sha512sums_x86_64=('2a591d2dacbedf3fce60f376f6dadc5032134f9f95c4f826efd5db09d1ad9cdbe0191d36f4fbf8d10b7cc408e3e51e6ed1220eb401c81ca9b65fdf3be5dcbcbb'
                   'ef215072cc9ec54ab4d8b2456bfe50107deb0a5793f312b747ca0479acfe1286e2541ace25a5aeae426ef77be63e92ebbaff3c7af694afd31ee33c3f1ef21d7b')
sha512sums_i686=('c200bdd34c82be8aa5dcc6f7a72d5163de3026ab82060ab160321c0f7b25feb3bc5a75571e12ba3f07d285197677b0ccf9272bf229c3baf7d73bd43c132fbfae'
                 'b163d7248a34efb0baa3f5d05820614bd8a4da7fec1579741d1641941b2b3aa8743a0877b436b94d79e979330041ab1388314457be207dc8206b2464f0c6289d')
sha512sums_pentium4=('c200bdd34c82be8aa5dcc6f7a72d5163de3026ab82060ab160321c0f7b25feb3bc5a75571e12ba3f07d285197677b0ccf9272bf229c3baf7d73bd43c132fbfae'
                     'b163d7248a34efb0baa3f5d05820614bd8a4da7fec1579741d1641941b2b3aa8743a0877b436b94d79e979330041ab1388314457be207dc8206b2464f0c6289d')
sha512sums_armv7h=('6945a62f979e61f6b513a06ee0e5f8ba42be7b034c775fb81d016348b7e25ecf26e33e64781417e68e0840bccea345eaa02b31fdac73fc4dc5ec7620353bd9de'
                   'b649a191c85bbf52eef3f2c53f9f00fc82bdcbc8f5e1e3589326be4772eaa3070174a6735757f288ac1a28bfc84ebb9a316f621be6a79014cfea0fcd49856f2f')
sha512sums_aarch64=('64a6d8bfa30df17a8c5e97757b234aaa457758bbfa1a99ed0780395debbb5844503ede6db3b21cdb2e6493b31e62218cdc4c2d316c504cf20a69aa58b08d7917'
                    '441c1ea68378d41b6b112b6578bcb717371310631921dec302161fe1ea28739c476af5f658f6c97f538c65bc2b0b95fe54f327cbe2abb8eae931d0dbd8bf26bf')

prepare() {
	sed -i -e "s/%%PKGNAME%%/$_pkgname/g" -e "s/%%PROJECTNAME%%/$_projectname/g" "$srcdir/electron-launcher.sh"
}

package() {
	cd "$srcdir/"
	install -dm755 "$pkgdir/usr/lib/$_pkgname/"
	find . -mindepth 1 -maxdepth 1 -type f ! -name "*.zip" ! -name "LICENSE*" -exec cp -r --no-preserve=ownership --preserve=mode -t "$pkgdir/usr/lib/$_pkgname/." {} +

	for _folder in 'locales' 'resources'; do
		cp -r --no-preserve=ownership --preserve=mode "$_folder/" "$pkgdir/usr/lib/$_pkgname/$_folder/"
	done

	install -Dm755 'electron-launcher.sh' "$pkgdir/usr/bin/$_pkgname"

	for _license in 'LICENSE' 'LICENSES.chromium.html'; do
		install -Dm644 "$_license" "$pkgdir/usr/share/licenses/$pkgname/$_license"
	done
}
