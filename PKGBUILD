# Maintainer: Maarten de Vries <maarten@de-vri.es>
pkgname=ensenso-sdk
pkgdesc="Ensenso SDK and tools"
pkgver=2.3.1536
pkgrel=2
arch=(x86_64)
license=(custom)
url='http://ensenso.com'
depends=('glibc' 'glu' 'libsm')
optdepends=(
	'ueyed: for capturing from live cameras'
	'qt4: for included GUI tools'
)

source=(
	"$pkgname-$pkgver.tar.bz2::https://download.ensenso.com/s/ensensosdk/download?files=ensenso-sdk-$pkgver-x64.tar.bz2"
)

sha512sums=('dcce023ec35dc1502a6557a1d8c08b7d40d7a7ddf3b9b48e48e2582a4e5a79da057addfc195e743a341955b63d0626e3108101e9e2e75d1ea941b8581b8f4fb1')

# Stripping results in a segfaulting NxView somehow.
options=(!strip)

package() {
	local dir="$srcdir/ensenso-sdk-$pkgver-x64-c01d55d"

	mkdir -p "$pkgdir/usr"
	mkdir -p "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/usr/include"
	mkdir -p "$pkgdir/usr/share/doc"
	mkdir -p "$pkgdir/usr/share/licenses/$pkgname"

	cp -a "$dir/usr/lib" "$pkgdir/usr/"
	cp -a "$dir/opt" "$pkgdir/"

	rm -r "$pkgdir/opt/ensenso/lib"

	ln -s "/opt/ensenso/manual/html"           "$pkgdir/usr/share/doc/$pkgname"
	ln -s "/opt/ensenso/development/c/include" "$pkgdir/usr/include/ensenso"

	ln -s "/opt/ensenso/bin/NxView"     "$pkgdir/usr/bin/nxView"
	ln -s "/opt/ensenso/bin/NxCalTab"   "$pkgdir/usr/bin/nxCalTab"
	ln -s "/opt/ensenso/bin/NxProfiler" "$pkgdir/usr/bin/nxProfiler"
	ln -s "/opt/ensenso/bin/NxTreeEdit" "$pkgdir/usr/bin/nxTreeEdit"

	install -D "$dir/opt/ensenso/eula.txt" "$pkgdir/usr/share/licenses/$pkgname/eula.txt"
	install -D "$dir/Readme"               "$pkgdir/opt/ensenso/"
}
