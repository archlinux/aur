# Maintainer: SelfRef <arch@selfref.dev>

_basename=mrpack-install
pkgname="${_basename}-git"
pkgver=r237.ca99c1a
pkgrel=1
pkgdesc="Modrinth Modpack server deployment"
arch=('any')
url="https://github.com/nothub/mrpack-install"
license=('MIT')
provides=('mrpack-install')
conflicts=('mrpack-install')
makedepends=('go')
source=("${_basename}"::"git+https://github.com/nothub/mrpack-install.git")
md5sums=('SKIP')

pkgver() {
	cd "$_basename"
	( set -o pipefail
		git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
	)
}

build() {
	cd "$_basename"
	make
}

package() {
	install -Dm755 -t "${pkgdir}/usr/bin" "${_basename}/out/mrpack-install"
}
