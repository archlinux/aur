pkgname=flypaper
pkgver=0.5.0
pkgrel=1
pkgdesc='Externally bind or mark sockets on the fly'
arch=('x86_64')
url='https://codeberg.org/iguanajuice/flypaper'
license=('GPL-3.0')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('f85ab0567746b248f614d3f4e0573403825aa44a8af7c6b15816a14808bbb218')
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
