# Maintainer: Carl Kittelberger <icedream@icedream.pw>
pkgname=fw-fanctrl-git
pkgver=r29.20a06f4
pkgrel=2
pkgdesc="A simple systemd service to better control Framework Laptop's fan"
arch=(any)
url="https://github.com/TamtamHero/fw-fanctrl"
license=('BSD-3')
groups=()
depends=(python-watchdog ectool)
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
            'ba58336a8e46fab3d1aad40a99eaead44af41ab530dcd72c31e8f6d098c8e2dc'
            '14745a7cb3b2cefd2dca87532a924bae684d878b55608a6799916f3c34821bb3')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname%-git}"

	install -Dm0755 ./fanctrl.py "${pkgdir}"/usr/bin/fw-fanctrl
	install -Dm0655 ./config.json "${pkgdir}"/etc/fw-fanctrl/config.json
	install -Dm0655 "${srcdir}/fw-fanctrl.service" "${pkgdir}"/usr/lib/systemd/system/fw-fanctrl.service
	install -Dm0755 "${srcdir}/fw-fanctrl-suspend" "${pkgdir}"/usr/lib/systemd/system-sleep/fw-fanctrl-suspend
}
