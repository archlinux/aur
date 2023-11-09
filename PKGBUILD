# Maintainer: asaka <aisk1988@gmail.com>
pkgname=lean-cli-git
pkgver=r821.e6d9791
pkgrel=1
pkgdesc="LeanCloud command line tool"
arch=('i686' 'x86_64')
url="https://leancloud.cn"
license=('Apache')
groups=()
depends=()
makedepends=('git' 'go')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/leancloud/lean-cli')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	pwd
	go build -ldflags="-X lean.pkgType=aur-git -s -w" -o lean-output ./lean/*.go
}

check() {
	cd "$srcdir/${pkgname%-git}"
	pwd
	./lean-output --version | grep -q 'lean version'
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dm755 "lean-output" "$pkgdir/usr/bin/lean"
	install -Dm644 "LICENSE.txt" "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE.txt"
}
