## Maintainer: Moses Narrow <moe_narrow@skycoin.com>
_projectname=fyne-io
pkgname=fyneterm
_pkgname=terminal
_githuborg=${FORK:-$_projectname}
pkgdesc="A graphical terminal emulator for Linux using Fyne"
_pkggopath=github.com/${_githuborg}/${_pkgname}
pkgver=r190.46c1d21
pkgrel=1
arch=( 'i686' 'x86_64' 'aarch64' 'armv8' 'armv7' 'armv7l' 'armv7h' 'armv6h' 'armhf' 'armel' 'arm')
url=https://${_pkggopath}
license=('MIT')
makedepends=("git" "go")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

build() {
cd "${srcdir}/${_pkgname}/" || exit
go build -o ${pkgname} ./cmd/${pkgname}/
}

package() {
	mkdir -p "${pkgdir}/usr/bin/"
	install -Dm755 ${srcdir}/${_pkgname}/${pkgname} "${pkgdir}/usr/bin/"
}
