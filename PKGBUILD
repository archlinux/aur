# Maintainer: Carl Kittelberger <icedream@icedream.pw>
pkgname=fw-fanctrl-git
pkgver=r37.fb4c933
pkgrel=1
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
source=("${pkgname%-git}::git+https://github.com/TamtamHero/fw-fanctrl.git")
noextract=()
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname%-git}"

	./install.sh \
		--dest-dir "${pkgdir}" \
		--prefix-dir "/usr" \
		--sysconf-dir "/etc" \
		--no-ectool \
		--no-post-install
}
