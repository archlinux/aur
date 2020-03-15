# Maintainer: Hauke Rehfeld <aur.archlinux.org@haukerehfeld.de>
pkgname=sshfs-reconnect-git
pkgver=r1.34ca815
pkgrel=1
pkgdesc="An easy command to mount sshfs as reconnect."
arch=('x86_64' 'i686')
url="https://github.com/hrehfeld/sshfs-reconnect"
depends=('sshfs')
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
    install -Dm755 "$srcdir/${pkgname%-git}/sshfs-reconnect" "$pkgdir/usr/bin/sshfs-reconnect"
}
