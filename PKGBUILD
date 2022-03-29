# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=pillager-git
pkgver=0.8.0.r3.eb653b7
pkgrel=1
pkgdesc='Pillage filesystems for sensitive information with Go'
arch=(x86_64)
url=https://github.com/brittonhayes/pillager
license=(MIT)
makedepends=(git go)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url.git")
md5sums=(SKIP)

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
	cd "${pkgname%-git}"
	go mod download
	go mod tidy
}

build() {
	cd "${pkgname%-git}"
	go build -v -o bin/pillager cmd/pillager/main.go
}

package() {
	cd "${pkgname%-git}"
	install -Dm755 bin/pillager -t "$pkgdir/usr/bin"
}
