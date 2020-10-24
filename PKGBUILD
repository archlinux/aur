# Maintainer: spikecodes <19519553+spikecodes@users.noreply.github.com>
pkgname=calyxos-flasher-git
_pkgname=${pkgname%-git}
pkgver=r108.ff9a4de
pkgrel=1
pkgdesc="A simple way to install CalyxOS on your device"
arch=('any')
url="https://github.com/AOSPAlliance/device-flasher"
license=("Apache")
makedepends=("go")
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("${_pkgname}::git+${url}")
sha256sums=("SKIP")

pkgver() {
	cd "${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${_pkgname}"
	export GOOS="linux"
	export GOARCH="amd64"
	go build -o calyxos-flasher
}

package() {
	cd "${_pkgname}"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
	install -Dm755 calyxos-flasher "$pkgdir/usr/bin/${_pkgname}"
}
