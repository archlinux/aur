## Maintainer: OliverLew <oliver_lew at outlook dot com>
## Contributor: realasking
_pkgname=fcitx-fbterm
pkgname=fcitx-fbterm-git
pkgver=0.2.0.r1.ga0ecce1
pkgrel=1
pkgdesc='Fbterm support for fcitx'
arch=(x86_64 i686)
url='https://github.com/fcitx/fcitx-fbterm'
license=('GPLv2')
depends=('fbterm' 'fcitx')
provides=('fcitx-fbterm')
source=("git+https://github.com/fcitx/$_pkgname")
md5sums=('SKIP')
install=$pkgname.install

pkgver() {
	cd "$_pkgname"
	( set -o pipefail
	  git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
	  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	cd "$_pkgname"
	mkdir -p build
	cd build
	cmake .. -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "$_pkgname/build"
	make DESTDIR="${pkgdir}" install
}
