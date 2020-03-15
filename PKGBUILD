# Maintainer: Hauke Rehfeld <aur.archlinux.org@haukerehfeld.de>
pkgname=udiskie-systemd-git
pkgver=r1.7e71ca2
pkgrel=1
pkgdesc="User systemd service for udiskie auto mounting."
arch=('x86_64' 'i686')
url="https://github.com/hrehfeld/udiskie-systemd"
depends=('udiskie')
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
    install -Dm755 "$srcdir/${pkgname%-git}/udiskie.service" "$pkgdir/etc/systemd/user/udiskie.service"
}
