# Maintainer: zhiayang <zhiayang@nowhere>

pkgname=wgman
pkgver=0.3.7
pkgrel=1
pkgdesc='Simple WireGuard wrapper-manager-thing'
url='https://github.com/zhiayang/wgman'
depends=('wireguard-tools' 'libcap')
makedepends=()
checkdepends=()
license=(Apache)
arch=('any')
_commit='3f8f973c14ffcf1908e7d11aeb149ac4632eb331'
source=("git+https://github.com/zhiayang/wgman.git#commit=${_commit}")
sha256sums=('SKIP')

build() {
	cd wgman
	make build
}

package() {
	cd wgman
	install -Dm755 build/wgman "$pkgdir"/usr/bin/wgman

	mkdir -p "$pkgdir"/etc/wgman/
	install -Dm755 wgman.target "$pkgdir"/usr/lib/systemd/system/wgman.target
	install -Dm755 wgman@.service "$pkgdir"/usr/lib/systemd/system/wgman@.service
}
