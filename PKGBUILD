# Maintainer: Daniel Martí <mvdan@mvdan.cc>

pkgname=tyk
pkgver=2.3.2
pkgrel=1
pkgdesc="API gateway and management platform"
url="https://github.com/TykTechnologies/${pkgname}"
license=('custom:MPL2')
arch=('i686' 'x86_64')
makedepends=('git' 'go')
optdepends=('redis: required by a regular setup')
source=("git+${url}#tag=v${pkgver}")
sha1sums=('SKIP')

prepare() {
	cd "${srcdir}"
	mkdir -p "src/github.com/TykTechnologies"
	mv "${pkgname}" "src/github.com/TykTechnologies/${pkgname}"
}

build() {
	cd "${srcdir}/src/github.com/TykTechnologies/${pkgname}"
	GOPATH="${srcdir}" go build -ldflags='-s -w'
}

package() {
	cd "${srcdir}/src/github.com/TykTechnologies/${pkgname}"
	install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
