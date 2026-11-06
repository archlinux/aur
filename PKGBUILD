pkgname=flypaper
pkgver=0.5.1
pkgrel=0
pkgdesc='Externally bind or mark sockets on the fly'
arch=('x86_64')
url='https://codeberg.org/iguanajuice/flypaper'
license=('GPL-3.0')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('8485a362b5124b9b5923536fad0ad8afcdfcdade58969e8864d968f0f06ef6aa')
options=('!debug')

depends=(
	'bpf'
	'cjson'
	'clang'
	'grep'
	'iproute2'
	'libbpf'
	'linux-headers'
	'meson'
)

build() {
	cd "$pkgname"
	meson setup -Dprefix="$pkgdir/usr" -Dbuildtype=release -Dservicetype=systemd build
	ninja -C build
}

package() {
	cd "$pkgname"
	ninja -C build install
}
