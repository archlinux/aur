#Maintainer: Kimiblock Moe

pkgname=tdl-git
pkgver=r665.f46f64c
pkgrel=1
pkgdesc="A Telegram downloader/tools written in Golang"
arch=("any")
url="https://github.com/iyear/tdl"
license=("AGPL-3.0-or-later")
depends=()
makedepends=('go' 'git')
conflicts=('tdl')
backup=()
source=("git+https://github.com/iyear/tdl.git")
sha256sums=('SKIP')
provides=("tdl")

function pkgver() {
	cd "${srcdir}/tdl"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

function prepare() {
	cd "${srcdir}/tdl"
}

function build() {
	cd "${srcdir}/tdl"
	go build -trimpath -buildmode=pie -mod=readonly -modcacherw -ldflags "-linkmode external -extldflags \"${LDFLAGS}\""
}

#function check() {
#	cd "${srcdir}/tdl"
#	go test ./...
#}

function package() {
	install -Dm755 "${srcdir}/tdl/tdl" "${pkgdir}/usr/bin/tdl"
}
