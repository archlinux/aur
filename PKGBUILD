# Maintainer: eNV25 <env252525@gmail.com>

pkgname=keyd
pkgver=2.4.1
pkgrel=2
arch=('x86_64' 'aarch64')
pkgdesc="A key remapping daemon for linux. "
url="https://github.com/rvaiya/$pkgname"
license=('MIT')
# https://github.com/rvaiya/keyd/tags
_commit=4084a9d5009a0e4667465f06f010c161de7c785d
source=("git+$url.git#tag=$_commit")
sha256sums=('SKIP')

build() {
	cd "$srcdir/$pkgname/"
	make
}

package() {
	cd "$srcdir/$pkgname/"

	# opt-in for systemd service and libinput quirks
	install -dm755 "${pkgdir}/usr/lib/systemd/system"
	install -dm755 "${pkgdir}/usr/share/libinput"

	make DESTDIR="${pkgdir}" PREFIX='/usr' install
	echo 'g keyd' | install -Dm644 /dev/stdin "${pkgdir}/usr/lib/sysusers.d/${pkgname%-git}.conf"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname%-git}/"
}
