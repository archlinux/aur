# Maintainer: Carl Kittelberger <icedream@icedream.pw>
pkgname=fw-fanctrl-git
pkgver=r35.176d34b
pkgrel=3
pkgdesc="A simple systemd service to better control Framework Laptop's fan"
arch=(any)
url="https://github.com/TamtamHero/fw-fanctrl"
license=('BSD-3')
groups=()
depends=(python-watchdog fw-ectool-git)
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=("${pkgname%-git}::git+https://github.com/TamtamHero/fw-fanctrl.git" fw-fanctrl-suspend fw-fanctrl.service)
noextract=()
sha256sums=('SKIP'
            'a52883d4d14c964f7eba35bb74ce7989ede5063e53dcd9fe8799b076178a3db5'
            'c68d51ce6504a3ed3ba2f0b6291ee5bc4a8ff1147bba72244415f8b2f159a6ba')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname%-git}"

	install -Dm0755 ./fanctrl.py "${pkgdir}"/usr/bin/fw-fanctrl
	install -Dm0644 ./config.json "${pkgdir}"/etc/fw-fanctrl/config.json
	install -Dm0644 "${srcdir}/fw-fanctrl.service" "${pkgdir}"/usr/lib/systemd/system/fw-fanctrl.service
	install -Dm0755 "${srcdir}/fw-fanctrl-suspend" "${pkgdir}"/usr/lib/systemd/system-sleep/fw-fanctrl-suspend
}
