# Maintainer: Kimiblock Moe

pkgname=clash2singbox-git
pkgver=r106.ab07d2d
pkgrel=1
pkgdesc="将 clash.meta 格式的配置文件或链接转换为 sing-box 格式 "
arch=("any")
url="https://github.com/xmdhs/clash2singbox"
license=("MIT")
depends=()
makedepends=('go')
conflicts=('clash2singbox')
provides=('clash2singbox')
backup=()
source=("git+https://github.com/xmdhs/clash2singbox.git")
sha256sums=('SKIP')

function pkgver() {
	cd "${srcdir}/clash2singbox"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

function prepare() {
	cd "${srcdir}/clash2singbox"
}

function build() {
	cd "${srcdir}/clash2singbox"
	go build -trimpath -buildmode=pie -mod=readonly -modcacherw -ldflags "-linkmode external -extldflags \"${LDFLAGS}\""
}

function check() {
	cd "${srcdir}/clash2singbox"
	go test ./...
}

function package() {
	install -Dm755 "${srcdir}/clash2singbox/clash2singbox" "${pkgdir}/usr/bin/clash2singbox"
}
