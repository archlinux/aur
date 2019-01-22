# Maintainer: ravenstar <yexella at gmail dot com>

pkgname=gled-git
_pkgname=gled
pkgver=r4.97dfdc8
pkgrel=1
pkgdesc="Logitech G102 and G203 Prodigy Mouse LED control"
arch=('x86_64')
url="https://github.com/karlovskiy/gled"
license=('MIT')
makedepends=('git' 'go')
depends=('libusb')
provides=('gled')
source=("${pkgname}::git+https://github.com/karlovskiy/gled.git")
md5sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	export GOFLAGS="-buildmode=pie -gcflags=all=-trimpath=${PWD} -asmflags=all=-trimpath=${PWD} -ldflags=-extldflags=-zrelro -ldflags=-extldflags=-znow"
	cd "${_pkgname}"
	go build -o ${_pkgname} .
}

package() {
    cd "${_pkgname}"
    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}

