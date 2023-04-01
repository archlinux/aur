# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Nicola Squartini <tensor5@gmail.com> (electron-launcher.sh script)
# Contributor: Matthew McGinn <mamcgi@gmail.com>
_projectname='electron'
_pkgname="${_projectname}7"
pkgname="$_pkgname-bin"
pkgver='7.3.3'
pkgrel='4'
pkgdesc='Build cross platform desktop apps with web technologies - version 7 - binary version'
arch=('x86_64' 'i686' 'pentium4' 'armv7h' 'aarch64')
url="https://${_projectname}js.org"
license=('MIT')
provides=("$_pkgname")
conflicts=("$_pkgname")
depends=('c-ares' 'ffmpeg' 'gtk3' 'http-parser' 'libevent' 'libnghttp2' 'libxslt' 'libxss' 'minizip' 'nss' 're2' 'snappy')
optdepends=(
	'kde-cli-tools: file deletion support (kioclient5)'
	'libappindicator-gtk3: StatusNotifierItem support'
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
sha512sums_x86_64=('04488d7aad4e5da0170c4437e24cec00ffd03bcd40d0d836c6b322094ca2098c2eb9694c071cff38e71d934028e89bafa3b74f3777da2d4257d8bf9fa399a83c'
                   'c7baeed7b87fc8a6b51f0f4c22afe0919774e48e82b1008fd93dbf3f35e3e1852ea3759fcc90adb046382ea1f18870eec0b1e9f8969d18e77c102df709762e18')
sha512sums_i686=('4b3a7315cacf53dff38e73c926a5224256cbdf340752b653fe729ea0f8b027a82576c413eb031c306a9a371e3b1a8c9fe27c10d1033dfce6a8fad7dbe4b4974d'
                 '851fa4421241cd00d70a76c51c748f959df0c971d9bbb1a1e5aa41b1c67df1e6a49bc33e8c63d4512883aa5e3d0e6457ebcf95462d5b92887256d04a101edf10')
sha512sums_pentium4=('4b3a7315cacf53dff38e73c926a5224256cbdf340752b653fe729ea0f8b027a82576c413eb031c306a9a371e3b1a8c9fe27c10d1033dfce6a8fad7dbe4b4974d'
                     '851fa4421241cd00d70a76c51c748f959df0c971d9bbb1a1e5aa41b1c67df1e6a49bc33e8c63d4512883aa5e3d0e6457ebcf95462d5b92887256d04a101edf10')
sha512sums_armv7h=('8f981cf62466c3d411e8b28a0a6a7bca8640e67d73468d9927417659f300489871a3429f5c8fd0a4a0e818d264097f4a89a3cec2c9c3edfc0fe1b07c60adc688'
                   'ff2ac414057bcfe1c199a4d1fa34ba415f9c25c7dc12ad220178f9d3b66c6f4d7528e74fcadaa83e99d00cd3d3fc1907e333027d7f8377424d6f682c6291de14')
sha512sums_aarch64=('82b2ab2c08b999746c2ee3cfa2d154493ef79da7d1771650fa52a0f54dbfa1efaf5134ab92973a319dc238c7848eccf8e3a8de96fefe9e8c22db981342506c99'
                    '82e68fa9de191caa449864195a210fe5f0b45db53c903cdfaf239f8883f463a352c159126776eb65f86c5c589dde61486932b5b184c85120cf14583f9433d66f')

prepare() {
	sed -i -e "s/%%PKGNAME%%/$_pkgname/g" -e "s/%%PROJECTNAME%%/$_projectname/g" "$srcdir/electron-launcher.sh"
}

package() {
	cd "$srcdir/"
	install -dm755 "$pkgdir/usr/lib/$_pkgname/"
	find . -mindepth 1 -maxdepth 1 -type f ! -name "*.zip" ! -name "LICENSE*" -exec cp -r --no-preserve=ownership --preserve=mode -t "$pkgdir/usr/lib/$_pkgname/." {} +

	for _folder in 'locales' 'resources' 'swiftshader'; do
		cp -r --no-preserve=ownership --preserve=mode "$_folder/" "$pkgdir/usr/lib/$_pkgname/$_folder/"
	done

	chmod u+s "$pkgdir/usr/lib/$_pkgname/chrome-sandbox"

	install -Dm755 'electron-launcher.sh' "$pkgdir/usr/bin/$_pkgname"

	for _license in 'LICENSE' 'LICENSES.chromium.html'; do
		install -Dm644 "$_license" "$pkgdir/usr/share/licenses/$pkgname/$_license"
	done
}
