# Contributor: Maxim Devaev <mdevaev@gmail.com>
# Author: Maxim Devaev <mdevaev@gmail.com>


pkgname=kvmd-webterm
pkgver=0.14
pkgrel=1
pkgdesc="Pi-KVM Web Terminal (GoTTY)"
url="https://github.com/pi-kvm/kvmd-webterm"
license=(GPL)
arch=(any)
depends=(kvmd gotty)
makedepends=(go)
install=$pkgname.install
source=(
	$pkgname.install
	kvmd-webterm.service
	terminal.svg
	nginx.ctx-http.conf
	nginx.ctx-server.conf
	index.html
	manifest.yaml
)
md5sums=(
	"a8119b6f675ca954c71ecd241745df0c"
	"1a44d9a469c566b20bcf9b9dafa97fe6"
	"8310f16f1892706c6ee5d07d51393e00"
	"dc9e0d328cb2710ef2921737fded3229"
	"55b8aa8ebfe04146ff0ce8dd8e71c72d"
	"9abc035d7f58e1b18c6712d7b2831adb"
	"ad52c541f400b29e85770bbb3d6a5211"
)


package() {
	mkdir -p "$pkgdir/usr/lib/systemd/system"
	install -Dm644 kvmd-webterm.service "$pkgdir/usr/lib/systemd/system/kvmd-webterm.service"

	mkdir -p "$pkgdir/usr/share/kvmd/web/extras/webterm"
	cp terminal.svg "$pkgdir/usr/share/kvmd/web/extras/webterm"

	mkdir -p "$pkgdir/usr/share/kvmd/extras/webterm"
	cp nginx.*.conf index.html manifest.yaml "$pkgdir/usr/share/kvmd/extras/webterm"
}
