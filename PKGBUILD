# Maintainer: Tim Teichmann <teichmanntim@outlook.de>
pkgname=stater-git
_pkgname=stater
pkgver=r37.2f0024a
pkgrel=1
pkgdesc="Stater is a raylib based gui-app that can visualize pieces of data."
arch=('x86_64')
url="https://github.com/tim-tm/stater"
license=('MIT')
depends=('glibc' 'alsa-lib' 'mesa' 'libx11' 'libxrandr' 'libxi' 'libxcursor' 'libxinerama')
makedepends=('git' 'make' 'gcc')
source=("$_pkgname::git+https://github.com/tim-tm/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
	cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$_pkgname"
    make setup
    make
}

package() {
	cd "$_pkgname"
	sudo make install
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
