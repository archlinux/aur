# Maintainer: Kimiblock Moe

pkgname=automatamp-git
pkgver=r138.3104a3f
pkgrel=1
pkgdesc="NieR: Automata Multiplayer Mod (Server)"
arch=("any")
url="https://github.com/praydog/AutomataMP"
license=("MIT")
depends=('enet')
makedepends=('go' 'git')
conflicts=('automatamp')
provides=('automatamp')
backup=()
source=("git+https://github.com/praydog/AutomataMP.git")
sha256sums=('SKIP')

function pkgver() {
	cd "${srcdir}/AutomataMP"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

function build() {
	cd "${srcdir}/AutomataMP/server"
	go build -trimpath -buildmode=pie -mod=readonly -modcacherw -ldflags "-linkmode external -extldflags \"${LDFLAGS}\""
}

#function check() {
#	cd "${srcdir}/AutomataMP/server"
#	go test ./...
#}

function package() {
	install -Dm755 "${srcdir}/AutomataMP/server/server" "${pkgdir}/usr/bin/automatamp-server"
}

