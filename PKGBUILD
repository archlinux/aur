# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=nullshell-git
pkgver=0.0.8.r0.g2373dec
pkgrel=1
pkgdesc='do nothing but print keep alive characters, can be used for login shell - git checkout'
arch=('x86_64')
makedepends=('git' 'discount')
url='https://github.com/eworm-de/nullshell'
conflicts=('nullshell')
license=('GPL-3.0-or-later')
install=nullshell.install
validpgpkeys=('BD84DE71F493DF6814B0167254EDC91609BC9183')
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

