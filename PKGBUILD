# Maintainer: Andrei Alexeyev <akari@alienslab.net>

pkgname=lolidns-git
pkgver=0.1.r1.a94592d
pkgrel=1
pkgdesc="DNS proxy for losers"
arch=('any')
url="https://github.com/Akaricchi/lolidns"
license=('WTFPL')
groups=()
depends=('python' 'python-dnslib')
makedepends=('git' 'python-setuptools')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('pkgbuild-lolidns::git+https://github.com/Akaricchi/lolidns')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/pkgbuild-${pkgname%-git}"
	printf "%s" "$(git describe --tags --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

package() {
	cd "$srcdir/pkgbuild-${pkgname%-git}"
	python setup.py install --root="$pkgdir/" --optimize=1
	install -Dm644 "systemd/lolidns.service" "$pkgdir/usr/lib/systemd/system/lolidns.service"
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
