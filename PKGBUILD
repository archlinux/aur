# Maintainer: Kimiblock Moe

pkgname=sliding-sync-git
arch=('x86_64')
pkgver=r1448.bcbe725
pkgrel=1
pkgdesc="Run a sliding sync proxy. An implementation of MSC3575."
url=https://github.com/matrix-org/sliding-sync
license=("Apache")
depends=("matrix-synapse")
source=("git+https://github.com/matrix-org/sliding-sync.git")
makedepends=("go")
sha256sums=('SKIP')
provides=("sliding-sync")

function pkgver(){
	cd sliding-sync
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

function build(){
	cd "${srcdir}/sliding-sync"
	go build ./cmd/syncv3
}

function package(){
	cd sliding-sync
	install -Dm 755 "${srcdir}/sliding-sync/syncv3" "${pkgdir}/usr/bin/syncv3"
}
