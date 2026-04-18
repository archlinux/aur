pkgname=flypaper
pkgver=0.4.3
pkgrel=2
pkgdesc='Externally bind or mark sockets on the fly'
arch=('x86_64')
url='https://codeberg.org/iguanajuice/flypaper'
license=('GPL-3.0')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('f65c793843ce90709fee9cb64befb3adf4488696a4978317d47f93fc9a76ce66')

depends=(
	'bpf'
	'cjson'
	'clang'
	'libbpf'
	'linux-headers'
	'meson'
)

build() {
	cd "$pkgname"
	meson setup -Dbuildtype=release -Dsystemd=true build
	ninja -C build
}

package() {
	cd "$pkgname"
	DESTDIR="$pkgdir/usr" ninja -C build install
}
