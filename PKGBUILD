# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=nullshell-git
pkgver=0.0.7.r1.g09a906b
pkgrel=1
pkgdesc="do nothing but print keep alive characters, can be used for login shell - git checkout"
arch=('i686' 'x86_64')
makedepends=('git' 'discount')
url="https://github.com/eworm-de/nullshell"
conflicts=('nullshell')
license=('GPL')
install=nullshell.install
source=('git+https://github.com/eworm-de/nullshell.git')
sha256sums=('SKIP')

pkgver() {
	cd nullshell/

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		printf '%s.r%s.g%s' \
			"$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG})" \
			"$(git rev-list --count ${GITTAG}..)" \
			"$(git rev-parse --short HEAD)"
	else
		printf '0.r%s.g%s' \
			"$(git rev-list --count master)" \
			"$(git rev-parse --short HEAD)"
	fi
}

build() {
	cd nullshell/

	make
}

package() {
	cd nullshell/

	make DESTDIR="${pkgdir}" install
}

