# Maintainer: Patrik Karlström <pata.karlstrom@gmail.com>

pkgname=jotasync
pkgver=0.4.1
pkgrel=1
pkgdesc="rsync GUI with integrated scheduler"
arch=('any')
url="https://trixon.se/projects/jotasync"
license=('Apache')
depends=('java-runtime>=8')
makedepends=('desktop-file-utils')
source=(
	"https://trixon.se/files/$pkgname-$pkgver-bin.zip"
	'jotaclient.sh'
	'jotaserver.sh'
	'jotasync.sh'
	'jotasync.desktop'
)
sha256sums=(
	'095ef57586e03cd65bd7dda6f48aca592bc559e9f71e6b69ab977f9797bffef2'
	'fa3eb8adf913d5e4a72087dd99e826dedf38792ce229499c70f329a651f08f9c'
	'a81db2e919a697669a58a119a6bcf11570422abb6f67b0f381a4b65f5246b6af'
	'1bbbe11c32dba035dce9cd8737a9cc333a6559842d2721abcd5e5614b343c705'
	'7a7974ee27108b9adb1496ce261f2b023067fbb2902e97d4f62ceb12c73271c7'
)

package() {
	pushd "$srcdir/$pkgname-$pkgver"

	# jars
	install -d "$pkgdir/usr/share/java/jotasync"
	find -name '*.jar' -execdir install -m644 {} "$pkgdir/usr/share/java/jotasync" \;

	# icon
	install -d "$pkgdir/usr/share/icons/hicolor/256x256/apps"
	install -m644 jotasync.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/jotasync.png"

	popd

	# launchers
	install -Dm755 "$srcdir/jotasync.sh" "$pkgdir/usr/bin/jotasync"
	install -Dm755 "$srcdir/jotaclient.sh" "$pkgdir/usr/bin/jotaclient"
	install -Dm755 "$srcdir/jotaserver.sh" "$pkgdir/usr/bin/jotaserver"

	# .desktop
	desktop-file-install $pkgname.desktop --dir "$pkgdir/usr/share/applications/"

	# remove version from filename
	mv "$pkgdir/usr/share/java/jotasync/jotasync-${pkgver}.jar" "$pkgdir/usr/share/java/jotasync/jotasync.jar"
}
