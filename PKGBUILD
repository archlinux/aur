# Maintainer: Ved Patil <vedpatil611@gmail.com>
pkgname=low-battery-warning-git
pkgver=0.1.r12f678230
pkgrel=1
epoch=
pkgdesc="Light weight low battery warning notification"
arch=('x86_64')
url="https://github.com/vedpatil611/low-battery-warning"
license=('MIT')
groups=()
depends=('libnotify')
makedepends=('gcc' 'make' 'git')
checkdepends=()
optdepends=()
provides=('low-battery-warning')
conflicts=('low-battery-warning')
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
	cd "${_pkgname}"
	printf "0.1.r%s%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd low-battery-warning
	make
}

package() {
	cd low-battery-warning
	mkdir -p ${pkgdir}/opt/${pkgname}
	cp -rf * ${pkgdir}/opt/${pkgname}
	sudo make DESTDIR="${pkgdir}" install
	make clean
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
