# Maintainer: Lasha Kanteladze <kanteladzelasha339@gmail.com>
pkgname=dxhd-git
pkgver=master
pkgrel=0
pkgdesc="An X11 Hotkey Daemon"
arch=('x86_64')
url="https://github.com/dakyskye/dxhd"
license=('MIT')
depends=('util-linux')
makedepends=('git' 'go')
provides=('dxhd')
conflicts=('dxhd-bin')
source=("$pkgname::git+https://github.com/dakyskye/dxhd.git")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git rev-parse --short HEAD
}

build() {
	cd "$pkgname"
	GOOS=linux GOARCH=amd64 go build -ldflags "-s -w -X main.version=master-$pkgver" -o $pkgname .
}

package() {
	cd "$pkgname"
	install -Dm755 $pkgname "$pkgdir"/usr/bin/dxhd
}
