# shellcheck shell=bash
# shellcheck disable=SC2034,SC2148,SC2154
# Co-Maintainer: Daemon Lee Schmidt <DaemonLeeSchmidt@gmail.com>
# Maintainer: Zeke Sonxx <zeke@zekesonxx.com>
pkgname=fargo-git # '-bzr', '-git', '-hg' or '-svn'
pkgver=r19.2dd84e1
pkgrel=2
pkgdesc="Removes unseeable and ghost alpha from PNG images."
arch=('i686' 'x86_64')
url="https://github.com/DaemonLee/fargo"
license=('GPL3')
groups=()
depends=('libvips-git')
makedepends=('git' 'perl')
provides=("${pkgname%-VCS}")
conflicts=("${pkgname%-VCS}")
replaces=()
backup=()
options=()
install=
source=('fargo::git+https://github.com/DaemonLee/fargo')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}" || exit
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}" || exit
	make
}

package() {
	cd "$srcdir/${pkgname%-git}" || exit
	make DESTDIR="$pkgdir/" install
}
