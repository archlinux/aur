# Maintainer: drpebcak <tayworm@gmail.com>
pkgname='acorn-cli-git'
pkgver=git
pkgrel=1
pkgdesc="A simple application deployment framework for Kubernetes (git build from latest commit)"
arch=('x86_64')
url="https://www.acorn.io"
license=('Apache')
makedepends=('git' 'go')
source=('acorn::git+https://github.com/acorn-io/acorn.git#branch=main')
noextract=()
md5sums=('SKIP')

build() {
	cd "acorn"
	export CGO_ENABLED=0 
	go build -o bin/acorn -ldflags "-s -w -X 'github.com/acorn-io/acorn/pkg/version.Tag=$pkgver'"
}

check() {
	cd "acorn"
	./bin/acorn -v
}

package() {
	cd "acorn"
	install -Dm755 bin/acorn "$pkgdir"/usr/bin/acorn
}

