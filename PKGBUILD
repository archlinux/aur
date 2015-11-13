# Maintainer: Maarten de Vries <maarten@de-vri.es>
pkgname=ensenso-sdk
pkgdesc="Ensenso SDK and tools"
pkgver=1.3.167
pkgrel=1
arch=(x86_64)
license=(custom)
url='http://ensenso.com'
depends=('glibc' 'glu' 'libsm')
optdepends=('ueyed: for capturing from live cameras')

source=(
	"http://dl.ensenso.de/public/Software/EnsensoSDK/EnsensoSDK-$pkgver-x64.tar.bz2"
)

sha512sums=(
	'bac71a28b30135c5960c12c2d00b0392fda2587851c3f57136a51caf90ff25033023461fc1cee51bd793dd3e66bb3d2d82f62cb9be07c1371ca8d7859b8c5ffa'
)

__install_dir() {
	local source_dir="$1"
	local target_dir="$2"
	local mode="$3"

	for file in $(find "$source_dir" -type f); do
		install -m "$mode" -D "$file" "$target_dir/${file#${source_dir}/}"
	done
}

package() {
	cd "$srcdir"

	__install_dir  "EnsensoSDK-$pkgver-x64-35717b5/usr/lib"                            "$pkgdir/usr/lib"                     755
	__install_dir  "EnsensoSDK-$pkgver-x64-35717b5/usr/bin"                            "$pkgdir/usr/bin"                     755
	__install_dir  "EnsensoSDK-$pkgver-x64-35717b5/opt/ensenso/manual/html"            "$pkgdir/usr/share/doc/ensenso"       644
	__install_dir  "EnsensoSDK-$pkgver-x64-35717b5/opt/ensenso/development/c/include"  "$pkgdir/usr/include/ensenso"         644
	__install_dir  "EnsensoSDK-$pkgver-x64-35717b5/opt/ensenso/development/examples"   "$pkgdir/usr/share/ensenso/examples"  644
	__install_dir  "EnsensoSDK-$pkgver-x64-35717b5/opt/ensenso/development/halcon"     "$pkgdir/usr/share/ensenso/halcon"    644
	__install_dir  "EnsensoSDK-$pkgver-x64-35717b5/opt/ensenso/development/halcon"     "$pkgdir/usr/share/ensenso/halcon"    644

	install -D "EnsensoSDK-$pkgver-x64-35717b5/opt/ensenso/eula.txt" "$pkgdir/usr/share/licenses/ensenso-sdk/LICENSE"
}
