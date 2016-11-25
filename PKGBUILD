# Maintainer: Ian Beringer <ian@ianberinger.com>

pkgname=lf-git
_pkgname=lf
pkgver=r163.bfd33f8
pkgrel=1
license=('MIT')
pkgdesc='lf is a terminal file manager written in Go'
depends=("glibc")
makedepends=("git" "go>=1.6")
arch=("i686" "x86_64")
_gourl='github.com/gokcehan/lf'
url="https://${_gourl}"
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')
provides=("lf")
conflicts=("lf")

pkgver() {
	cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${_pkgname}"
	GOPATH="${srcdir}/go" go get -u "${_gourl}"
	GOPATH="${srcdir}/go" go build
}

package() {
	cd "${srcdir}/${_pkgname}"
	install -Dm755 ./lf					"${pkgdir}/usr/bin/lf"
  install -Dm644 ./LICENSE   	"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 ./README.md 	"${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
