# Maintainer: spikecodes <19519553+spikecodes@users.noreply.github.com>
pkgname=sdns-git
_pkgname=${pkgname%-git}
pkgver=r659.3089a62
pkgrel=1
pkgdesc="Privacy important, fast, recursive dns resolver server with dnssec support"
arch=('x86_64')
url="https://github.com/semihalev/sdns"
license=("MIT")
makedepends=("go")
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("${_pkgname}::git+${url}")
sha256sums=("SKIP")

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${_pkgname}"
	go build -o sdns .
}

package() {
	cd "${_pkgname}"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
	install -Dm755 sdns "$pkgdir/usr/bin/${_pkgname}"
}
