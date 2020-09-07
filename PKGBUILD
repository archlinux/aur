# Maintainer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>

pkgname=torrodle-git
_pkgname=torrodle
pkgver=1.0.4.r21.g770574b
pkgrel=1
license=('MIT')
pkgdesc='A mighty all-in-one magnet scraper & streamer'
makedepends=("git" "go>=1.12")
arch=("i686" "x86_64" "arm")
_gourl='github.com/tnychn/torrodle'
url="https://${_gourl}"
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  export GOPATH="${srcdir}"/go
  cd "${srcdir}/${_pkgname}"
	go build -o torrodle cmd/torrodle/main.go
  # clean now to ensure makepkg --clean works
  go clean -modcache
}

package() {
  cd "${srcdir}/${_pkgname}"

  install -Dm755 -t "${pkgdir}/usr/bin" ./torrodle
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ./LICENSE.txt
}
# vim:set ts=2 sw=2 et:
