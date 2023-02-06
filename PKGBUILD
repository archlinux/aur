# Maintainer: drpebcak <tayworm@gmail.com>
pkgname='kics-git'
pkgver=git
pkgrel=1
pkgdesc="Find security vulnerabilities, compliance issues, and infrastructure misconfigurations early in the development cycle of your infrastructure-as-code with KICS by Checkmarx. (git build from latest commit)"
arch=('x86_64')
url="https://kics.io"
license=('Apache')
makedepends=('git' 'go' 'make')
source=('kics::git+https://github.com/Checkmarx/kics.git#branch=master')
noextract=()
md5sums=('SKIP')

build() {
	cd "kics"
	export CGO_ENABLED=0
	go mod vendor
	make build
}

check() {
	cd "kics"
	./bin/kics version
}

package() {
	cd "kics"
	install -Dm755 bin/kics "$pkgdir"/usr/bin/kics
}

