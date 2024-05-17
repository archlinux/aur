# Maintainer: Carl Kittelberger <icedream@icedream.pw>
pkgname=fw-fanctrl-git
pkgver=r34.e97f4b3
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
            'db31b5bb877ead3c06548d0d1aecaffa57320e4331cd0bd90fa8fa225026b4e5'
            '2e7a8ceb24f342146b1d0d6e1c863eeccc221709d04ad617247f7e23dd1eb708')

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
