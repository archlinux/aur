# Maintainer: Tim Teichmann <teichmanntim@outlook.de>
pkgname=stater-git
_pkgname=stater
pkgver=r45.3111c89
pkgrel=1
pkgdesc="Stater is a raylib based gui-app that can visualize pieces of data."
arch=('x86_64')
url="https://github.com/tim-tm/stater"
license=('MIT')
depends=('glibc' 'raylib')
makedepends=('git' 'make' 'gcc' 'autoconf')
source=("$_pkgname::git+https://github.com/tim-tm/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
	cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$_pkgname"
    autoreconf -vi
    ./configure
    make
}

package() {
	cd "$_pkgname"
	make DESTDIR="$pkgdir" install
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
