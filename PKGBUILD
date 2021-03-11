# Maintainer: Ignacy Kuchciński (ignapk) <ignacykuchciński@gmail.com>
pkgname=ledcapture-git
pkgver=r4.3822a88
pkgrel=1
pkgdesc="Flashes keyboard leds on incoming/outgoing network packets"
arch=('any')
url="https://github.com/danhab99/ledcapture"
license=('MIT')
depends=(python-pyshark python-netifaces)
makedepends=(git)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/danhab99/ledcapture.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -D "${pkgname%-git}.py" "$pkgdir/usr/bin/${pkgname%-git}"
	install -Dm644 ledcap.service "$pkgdir/etc/systemd/system/ledcap.service"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE"
}
