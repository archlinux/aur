## Maintainer: Moses Narrow <moe_narrow@skycoin.com>
_projectname=danfragoso
pkgname=thdwb
_pkgname=${pkgname}
_githuborg=${FORK:-$_projectname}
pkgdesc="🌭 The hotdog web browser and browser engine 🌭 written in go"
_pkggopath=github.com/${_githuborg}/${_pkgname}
pkgver=r317.beb2b4a
pkgrel=1
arch=( 'i686' 'x86_64' 'aarch64' 'armv8' 'armv7' 'armv7l' 'armv7h' 'armv6h' 'armhf' 'armel' 'arm')
url=https://${_pkggopath}
license=('MIT')
makedepends=("git" "go")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

build() {
cd "${srcdir}/${pkgname}/" || exit
make build
}

package() {
	mkdir -p "${pkgdir}/usr/bin/"
	install -Dm755 ${srcdir}/${pkgname}/bin/${pkgname} "${pkgdir}/usr/bin/"
}
