# Maintainer: Brad Johnson <bradsk88@gmail.com>
pkgname=gitify-git
pkgver=4.20.r1.be941f4
pkgrel=1
epoch=
pkgdesc="GitHub Notifications on your menu bar"
arch=("x86_64")
url="https://github.com/manosim/gitify.git"
license=('MIT')
groups=()
depends=()
makedepends=(git yarn)
checkdepends=()
optdepends=()
provides=(gitify)
conflicts=(gitify)
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
	printf "4.20.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd gitify
	yarn install
}

build() {
	cd gitify
	yarn build
	yarn make:linux
}

package() {
	cd gitify
	mkdir -p ${pkgdir}/opt/${pkgname}
	cp -r dist/linux-unpacked/* ${pkgdir}/opt/${pkgname}
	install -dm 755 "${pkgdir}/usr/bin/"
	ln -s "/opt/${pkgname}/gitify" "${pkgdir}/usr/bin/gitify"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 README.md "${pkgdir}/usr/share/licenses/${pkgname}/README.md"
}
