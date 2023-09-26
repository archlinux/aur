# Maintainer: TurboHsu <hsuturbo@outlook.com>
pkgname=munager-git
_pkgname=munager
pkgrel=2
pkgver=0.1.1.r1.g3bbc577
pkgdesc="Music managing utils which can fetch lyrics and do syncs."
arch=('any')
url="https://github.com/TurboHsu/munager"
license=('Apache')
makedepends=('git' 'go')
provides=('munager')
source=("git+${url}.git#branch=main")

pkgver() {
	cd "${srcdir}"/"${_pkgname}"/
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}"/"${_pkgname}"/
	go build -ldflags="-s -w -linkmode external -extldflags \"${LDFLAGS}\"" \
		 -trimpath \
		 -buildmode=pie \
		 -mod=readonly \
		 -modcacherw \
		 .
}

package() {
	cd "${srcdir}"/"${_pkgname}"/
	install -Dm 755 munager -t "${pkgdir}"/usr/bin
}
sha256sums=('SKIP')
