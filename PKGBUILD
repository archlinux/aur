_pkgname=mosint
pkgname="${_pkgname}-git"
pkgver=2.2.r125.79600a8
pkgrel=1
pkgdesc='An automated e-mail OSINT tool'
arch=('any')
url='https://github.com/alpkeskin/mosint'
license=('UNKNOWN')
makedepends=('go')
conflicts=("${_pkgname}")
source=("${_pkgname}::git+${url}")

pkgver() {
  cd ${_pkgname}
  base="$(grep mosint main.go | grep v | cut -d v -f 2)"
  printf "${base}.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${_pkgname}
  go build .
}

package() {
  cd ${_pkgname}
  install -Dm755 ${_pkgname} "${pkgdir}/usr/bin/${_pkgname}"
}

sha256sums=('SKIP')
