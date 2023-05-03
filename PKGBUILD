# Contributor: Nicola Squartini <tensor5@gmail.com> (electron-launcher.sh script)
# Contributor: Matthew McGinn <mamcgi@gmail.com>
# Contributor: Asuka Minato

_projectname='electron'
_pkgname="${_projectname}1"
pkgname="$_pkgname-bin"
pkgver='1.8.8'
pkgrel='1'
pkgdesc='Build cross platform desktop apps with web technologies - version 1 - binary version'
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
sha512sums_x86_64=('67de00def74c6c639ed295ed270d5ca1409f73c3578e4335965e553c099bdf288476dbc057f46227666924d5e292250b98bd5737d8d3c3153696ef3586fc53a5'
                   'fecda97b703cf1e664bb4f80489f559873c6cd93adc8935f540770a5c72d2a5e02467329770e45e52b77501d37ecda2c85d9ee5e165e5ad479442c203978d849')
sha512sums_i686=('a11ccbf0f64525c64bb0f7c930438040a107c3851f31c67446fbba5c28260fa703f650e644c74d691819a13a4dc810b899e039075c5b732b37eccbaa35d3e386'
                 'df8145eaf9c962a7a0e1ad19f3b599f4f5955f5a3567ef4db35ccfcb2235dcad6c2256000120a66c09cd72d1e98481a9e95f001fd9a0a7d6b25f1f906d2f7a7d')
sha512sums_pentium4=('a11ccbf0f64525c64bb0f7c930438040a107c3851f31c67446fbba5c28260fa703f650e644c74d691819a13a4dc810b899e039075c5b732b37eccbaa35d3e386'
                     'df8145eaf9c962a7a0e1ad19f3b599f4f5955f5a3567ef4db35ccfcb2235dcad6c2256000120a66c09cd72d1e98481a9e95f001fd9a0a7d6b25f1f906d2f7a7d')
sha512sums_armv7h=('601dbe97c16c650ad30b226696588689c778c31c6e8f4620cb427b8b23b1560e31c0e496035ccd4b58ad5f50ea1475f8af79e5d0b0803fd901a1eff52f16aae5'
                   'e88888559e69a20039d47385927ac0abb00e792be28a4919c0e640cf8102533bd82e94e8e5792329feebaa9a2063cce369d7c1f1a144dc5750d1858334325d3e')
sha512sums_aarch64=('c360571d58e178adf2e7852175a901b1635a02dfb28ddfa298f0d1c216029dfe17a8a29b7caf637014804fed43ae9143ac662924169f80732749c22b70fefc29'
                    '726036ff9659a69c3ef0b97765e49afb259d6ef742af750358686a750d71aa21abaadaadde7f1a12a44bbf9d08f358dc99a827ecc47990ac2dad5aa1a117a1b7')

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
