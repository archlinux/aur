# Maintainer: thepasto <thepasto@gmail.com>
pkgname=acestream-engine-armv7h
pkgver=3.1.48
pkgrel=1
pkgdesc='ACE Stream engine armv7h version'
arch=('armv7h')
url="https://github.com/lysyiklad/service.system.acestreammedia"
license=('GPL')
groups=('acestream-engine')
makedepends=('git')
conflicts=('acestream-engine');
depends=('git')
source=(
	"$pkgname"::'git+https://github.com/lysyiklad/service.system.acestreammedia.git'
	"acestream.conf"
	"acestream-engine.service"
)

sha256sums=(
	'SKIP'
	'1a0f151c063657dc1421d6d4a0eb00d35caa11f3039ea4cf1f40835299ece6b0'
	'a075f5f7b428d4ed24e91a7a18e3184c0d1422d2659d4e44a2b74b5810ec3c40'
	)

prepare() {
	cd "$srcdir/$pkgname"
	echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
	sed -i 's/oe_setup_addon service.system.acestreammedia/#oe_setup_addon service.system.acestreammedia/g' acestream.engine/acestream.start
	sed -i 's/oe_setup_addon service.system.acestreammedia/#oe_setup_addon service.system.acestreammedia/g' acestream.engine/acestream.stop
}

package() {
	install -d "${pkgdir}/opt/acestream.engine"
	install -Dm644 "$srcdir/acestream-engine.service" "$pkgdir/usr/lib/systemd/system/acestream-engine.service"
	cd "$srcdir/$pkgname"
	cp -ar acestream.engine/* "${pkgdir}/opt/acestream.engine"
	install -Dm644 "$srcdir/acestream.conf" "$pkgdir/opt/acestream.engine/androidfs/acestream.engine/acestream.conf"
}
