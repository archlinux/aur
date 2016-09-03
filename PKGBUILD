# Maintainer: Ian Beringer <ian@ianberinger.com>

pkgname=lf-git
_pkgname=lf
pkgver=r67.f304f86
pkgrel=1
license=('MIT')
pkgdesc='lf is a terminal file manager written in Go'
depends=("glibc")
makedepends=("git" "go>=1.6")
arch=("i686" "x86_64")
url='https://github.com/gokcehan/lf'
source=("${_pkgname}::git+https://github.com/gokcehan/lf.git")
sha256sums=('SKIP')
provides=("lf")
conflicts=("lf")

pkgver() {
	cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${_pkgname}"
	go build
}

package() {
	cd "${srcdir}/${_pkgname}"
	install -Dm755 ./lf					"${pkgdir}/usr/bin/lf"
  install -Dm644 ./LICENSE   	"${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -Dm644 ./README.md 	"${pkgdir}/usr/share/doc/${_pkgname}/README"
}
