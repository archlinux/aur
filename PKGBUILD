# Maintainer: Moses Narrow <moses@skycoin.com>
pkgname=goimports-reviser
pkgver=3.3.0
pkgrel=1
pkgdesc=" Right imports sorting & code formatting tool (goimports alternative)."
arch=('i686' 'x86_64')
url="https://github.com/incu6us/goimports-reviser"
license=('MIT')
makedepends=('git' 'go')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
_version=$(git ls-remote --tags --refs --sort="version:refname" ${url}.git | tail -n1)
_version=${_version##*/}
_version=${_version%%-*}
_version=${_version//v/}
echo ${_version}
}

build() {
	cd ${srcdir}/${pkgname}
	go build .
}

package() {
    install -Dm755 ${srcdir}/${pkgname}/${pkgname} ${pkgdir}/usr/bin/${pkgname}
	install -Dm644 ${srcdir}/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
