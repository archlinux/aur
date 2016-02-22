# Maintainer: Maarten de Vries <maarten@de-vri.es>
pkgname=ensenso-sdk
pkgdesc="Ensenso SDK and tools"
pkgver=1.3.180
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
	'b9013f6bf4a0b6ee6736ccc37c124d08ca34490b12537662d67b2210172e61414ef314e13e2246fe90814fbab04f285f7c006d4d78aa984a3fce26571d9af223'
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

	__install_dir  "EnsensoSDK-$pkgver-x64-676119d/usr/lib"                            "$pkgdir/usr/lib"                     755
	__install_dir  "EnsensoSDK-$pkgver-x64-676119d/usr/bin"                            "$pkgdir/usr/bin"                     755
	__install_dir  "EnsensoSDK-$pkgver-x64-676119d/opt/ensenso/manual/html"            "$pkgdir/usr/share/doc/ensenso"       644
	__install_dir  "EnsensoSDK-$pkgver-x64-676119d/opt/ensenso/development/c/include"  "$pkgdir/usr/include/ensenso"         644
	__install_dir  "EnsensoSDK-$pkgver-x64-676119d/opt/ensenso/development/examples"   "$pkgdir/usr/share/ensenso/examples"  644
	__install_dir  "EnsensoSDK-$pkgver-x64-676119d/opt/ensenso/development/halcon"     "$pkgdir/usr/share/ensenso/halcon"    644
	__install_dir  "EnsensoSDK-$pkgver-x64-676119d/opt/ensenso/development/halcon"     "$pkgdir/usr/share/ensenso/halcon"    644

	install -D "EnsensoSDK-$pkgver-x64-676119d/opt/ensenso/eula.txt" "$pkgdir/usr/share/licenses/ensenso-sdk/LICENSE"
}
