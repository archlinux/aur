# Maintainer: Youngbin Han <sukso96100@gmail.com>
# Contributor: blainester <theblainestory@gmail.com>
# Contributor: mar77i <mar77i at protonmail dot ch>
pkgname=micro
pkgver=1.4.1
pkgrel=1
pkgdesc="A modern and intuitive terminal-based text editor"
arch=('x86_64' 'i686')
url="https://github.com/zyedidia/micro"
license=('MIT')
makedepends=("git" "go")
optdepends=('xclip: Required for copying/pasting text')
conflicts=("micro-git")
_giturl=github.com/zyedidia/micro

prepare() {
	export GOPATH="${srcdir}"
	go get -v -d "${_giturl}/..."
	cd "${GOPATH}/src/${_giturl}"
	git checkout "tags/v${pkgver}"
	sed -r -i 's/^(build:).*$/\1/' Makefile
}

build() {
	cd "${GOPATH}/src/${_giturl}"
	make
}

package() {
	cd "${GOPATH}/src/${_giturl}"
	install -Dm755 "./micro" "${pkgdir}/usr/bin/micro"
	install -Dm644 "./LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
