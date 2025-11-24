# Maintainer: SelfRef <arch@selfref.dev>

_pkgbase=ab-download-manager
pkgname="$_pkgbase"
pkgver=1.7.1
pkgrel=1
pkgdesc="A Download Manager that speeds up your downloads"
arch=('any')
url="https://abdownloadmanager.com"
license=('Apache-2.0')
depends=(
	'libxrender'
	'libxtst'
	'harfbuzz'
	'fontconfig'
)
makedepends=(
	'git'
	'java-environment=21'
	'gradle'
)
optdepends=(
	'libappindicator-gtk3: tray icon support'
)
conflicts=('abdownloadmanager-bin')
source=(
	"$_pkgbase::git+https://github.com/amir1376/ab-download-manager.git#tag=v$pkgver"
	'abdownloadmanager.desktop'
)
sha256sums=('318169a55861512f3c6769359640f7039d2a218ef747e2a8b77e31e519c777c9'
            'd194cf142921d78c8a2a8c6c2b3a8b41bf2545eb2c7147a8f866946528227031')

build() {
	cd "$_pkgbase"
	export JAVA_HOME=/usr/lib/jvm/java-21-openjdk
	gradle createReleaseDistributable
}

package() {
	cd "$_pkgbase"
	mkdir -p "$pkgdir/opt/abdownloadmanager/"
	cp -r desktop/app/build/compose/binaries/main-release/app/ABDownloadManager/* "$pkgdir/opt/abdownloadmanager/"

	install -Dm644 desktop/app/icons/icon.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/abdownloadmanager.png"
	install -Dm644 "$srcdir/../abdownloadmanager.desktop" "$pkgdir/usr/share/applications/abdownloadmanager.desktop"
}

