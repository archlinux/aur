# Maintainer: normen <normen@users.noreply.github.com>
pkgname=whatscli-git
_pkgname=whatscli
pkgver=20260808.2dad103
pkgrel=1
pkgdesc='A command line interface for WhatsApp, based on go-whatsmeow and tview'
url='https://github.com/normen/whatscli'
arch=('i686' 'x86_64' 'armv7h')
makedepends=('git' 'go')
source=("git+${url}.git")
sha256sums=('SKIP')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git log -1 --format='%cd.%h' --date=short | tr -d -
}

build() {
  cd "${srcdir}/${_pkgname}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build -o "${_pkgname}" -ldflags "-s -w -X main.VERSION=${pkgver}" .
}

package() {
  install -Dm755 "${srcdir}/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}

# vim: ft=sh ts=2 sw=2 et
