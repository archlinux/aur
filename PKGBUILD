# Maintainer: Carl Kittelberger <icedream@icedream.pw>
pkgname=fw-fanctrl-git
pkgver=r23.e7150cc
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
            '61fb2628b9b8d0d1edf34108ba25736fd7bc72f3b9f382e1bd67fe88b9492f44'
            '14745a7cb3b2cefd2dca87532a924bae684d878b55608a6799916f3c34821bb3')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

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
