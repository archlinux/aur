# Maintainer: Youngbin Han <sukso96100@gmail.com>
# Contributor: blainester <theblainestory@gmail.com>
# Contributor: mar77i <mar77i at protonmail dot ch>
pkgname=micro
pkgver=1.3.4
pkgrel=5
pkgdesc="A modern and intuitive terminal-based text editor"
arch=('x86_64' 'i686')
url="https://github.com/zyedidia/micro"
license=('MIT')
depends=("go")
optdepends=('xclip: Required for copying/pasting text')
conflicts=("micro-git")

source=("https://github.com/zyedidia/$pkgname/archive/v$pkgver.tar.gz")

sha256sums=('SKIP')

build() {
	export GOPATH="$srcdir"
	mkdir -p "src/github.com/zyedidia"
	mv "${pkgname}-${pkgver}" "src/github.com/zyedidia/micro"
	cd "${srcdir}/src/github.com/zyedidia"
	go get -x -v ./...
	sed -r -i 's/^(build:).*$/\1/' Makefile
	make
}

package() {
	cd "${srcdir}/src/github.com/zyedidia"
	install -Dm755 "${srcdir}/${pkgname}-${pkgver}/micro" "${pkgdir}/usr/bin/micro"
	install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
