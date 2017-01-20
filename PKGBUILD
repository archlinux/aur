# Maintainer: Nicolas Schneider <nioncode+pkgbuild at gmail dot com>
pkgname=capsudo-git
pkgver=r9.6637183
pkgrel=2
pkgdesc="sudo for POSIX capabilities, git version"
arch=('any')
url="https://git.archlinux.org/users/thomas/capsudo.git/"
license=('unknown')
depends=(iniparser libcap)
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
backup=(etc/capsudoers)
source=('capsudo::git+https://git.archlinux.org/users/thomas/capsudo.git')
md5sums=('SKIP')
install=capsudo-git.install

pkgver() {
	cd "$srcdir/${pkgname%-git}"
# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
}
