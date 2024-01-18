# Maintainer: Kimiblock Moe

pkgname=rsearch-git
pkgver=r3.8069a79
pkgrel=1
pkgdesc="Simple tool to search a directory recursively. "
arch=("any")
url="https://github.com/Kimiblock/rsearch"
license=("GPL-3.0-or-later")
depends=()
makedepends=('go' 'git')
conflicts=('rsearch')
provides=('rsearch')
backup=()
source=("git+https://github.com/Kimiblock/rsearch.git")
sha256sums=('SKIP')

function pkgver() {
	cd "${srcdir}/rsearch"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

function build() {
	cd "${srcdir}/rsearch"
	go build -trimpath -buildmode=pie -mod=readonly -modcacherw -ldflags "-linkmode external -extldflags \"${LDFLAGS}\""
}

function check() {
	cd "${srcdir}/rsearch"
	go test ./...
}

function package() {
	install -Dm755 "${srcdir}/rsearch/rsearch" "${pkgdir}/usr/bin/rsearch"
}
