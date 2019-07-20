# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>
pkgname=checkmake
pkgver=0.1.0
pkgrel=2
pkgdesc="Experimental linter/analyzer for makefiles"
arch=('any')
url="https://github.com/mrtazz/checkmake"
license=('MIT')
makedepends=('go-pie')
conflicts=('checkmake-git')
source=("https://github.com/mrtazz/checkmake/archive/${pkgver}.tar.gz")
sha256sums=('e3a04e6bf4bbeb9730368c488db9c7f3cfec2d52d3f82bac5c8f9aa51b985f5e')

prepare(){
	mkdir -p gopath/src/github.com/mrtazz
	ln -rTsf "${pkgname}-${pkgver}" gopath/src/github.com/mrtazz/checkmake
}

build(){
	cd "gopath/src/github.com/mrtazz/checkmake"
	export GOPATH="${srcdir}/gopath"
	go install \
		-gcflags "all=-trimpath=${GOPATH}" \
		-asmflags "all=-trimpath=${GOPATH}" \
		./cmd/...
}

package() {
	install -Dm755 gopath/bin/checkmake "${pkgdir}/usr/bin/checkmake"
	cd "${pkgname}-${pkgver}"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
