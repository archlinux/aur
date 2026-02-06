# Maintainer: Prasanna Venkadesh <prasmailme@gmail.com>

pkgname=battinfo-git
pkgver=0.2.1.r20.2ce7b89
pkgrel=1
epoch=
pkgdesc="battinfo is a CLI tool & nim library to get battery detials."
arch=('x86_64')
url="https://gitlab.com/prashere/battinfo"
license=('GPL-3.0-or-later')
groups=()
depends=('glibc')
makedepends=('make' 'git' 'nim')
checkdepends=()
optdepends=()
provides=(battinfo)
conflicts=(battinfo)
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url.git")
noextract=()
sha256sums=('SKIP')
validpgpkeys=()

pkgver() {
	cd "$srcdir/battinfo"
	printf "$pkgver.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd battinfo
	make build_bin
}

package() {
	cd battinfo
	nimble install -p "--opt:size" --noRebuild  # required to install library modules
	install -Dm755 bin/battinfo "${pkgdir}/usr/bin/battinfo" # install the binary file
}
