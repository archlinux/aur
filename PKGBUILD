# Maintainer: Hauke Rehfeld <aur.archlinux.org@haukerehfeld.de>
pkgbase=mu-systemd
pkgname=mu-systemd-git
pkgver=r1.035d74b
pkgrel=1
pkgdesc="User systemd service and timer for mu mail indexing."
arch=('x86_64' 'i686')
url="https://github.com/hrehfeld/mu-systemd"
depends=('mu')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=("git+${url}.git")
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	git checkout master
}

package() {
	for f in "mu.service" "mu.timer"
	do
		install -Dm755 "$srcdir/${pkgname%-git}/$f" "$pkgdir/etc/systemd/user/$f"
	done
}
