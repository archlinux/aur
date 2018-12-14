# Maintainer: Tony Lambiris <tony@criticalstack.com>

pkgname=lemonade-git
pkgver=r74.ddbd6c1
_pkgname=lemonade
pkgrel=1
pkgdesc="Lemonade is a remote utility tool. (copy, paste and open browser) over TCP."
url="https://github.com/pocke/lemonade"
arch=('x86_64' 'i686')
license=('MIT')
makedepends=('go')
source=("${_pkgname}::git+https://github.com/pocke/lemonade.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${srcdir}"

	GOROOT="/usr/lib/go" GOPATH="${srcdir}/go" PATH="$PATH:$GOPATH/bin" \
		go get -v -d github.com/pocke/lemonade
}

build() {
	cd "${srcdir}/go/src/github.com/pocke/lemonade"

	GOROOT="/usr/lib/go" GOPATH="${srcdir}/go" PATH="$PATH:$GOPATH/bin" make
}

package() {
	cd "${srcdir}/go/src/github.com/pocke/lemonade"

	install -Dm755 "lemonade" "${pkgdir}/usr/bin/lemonade"
}
