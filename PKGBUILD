# Maintainer: Hauke Rehfeld <aur.archlinux.org@haukerehfeld.de>
pkgname=python-keyring-minimal-git
pkgver=r8.3cebb2a
pkgrel=1
pkgdesc="A minimal libsecret keyring in python that works with keepassxc."
arch=('x86_64' 'i686')
url="https://github.com/hrehfeld/python-keyring-minimal"
depends=('python' 'libsecret')
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
	for f in "keyring-minimal" "keyring-minimal-askpass"
	do
		install -Dm755 "$srcdir/${pkgname%-git}/$f" "$pkgdir/usr/bin/$f"
	done
}
