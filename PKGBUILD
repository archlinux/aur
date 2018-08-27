# Contributor: Ian Beringer <ian@ianberinger.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=lf
pkgver=r7
pkgrel=1
license=('MIT')
pkgdesc='lf is a terminal file manager written in Go'
depends=("glibc")
makedepends=("git" "go>=1.6")
arch=("i686" "x86_64")
_gourl='github.com/gokcehan/lf'
url="https://${_gourl}"
source=("git+https://github.com/gokcehan/lf.git#commit=ffa913d9431574da81bd90fb6fb9e8566823dbe")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --tags |tr - .
}

build() {
  cd "${srcdir}/${pkgname}"
  GOPATH="${srcdir}/go" go get -u "${_gourl}"
  GOPATH="${srcdir}/go" go build
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm755 ./lf "${pkgdir}"/usr/bin/lf
  install -Dm644 ./LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
  install -Dm644 ./README.md "${pkgdir}"/usr/share/doc/${pkgname}/README.md
}
