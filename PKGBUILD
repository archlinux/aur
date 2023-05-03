# Maintainer: Dominik Adrian Grzywak <starterx4 at gmail dot com>

pkgname=murse-git
pkgver=latest
pkgrel=3
pkgdesc="Open Fortress installing and updating tool. A CLI rewrite of the oftoast GUI tool."
arch=(x86_64)
url="https://git.sr.ht/~webb/murse"
license=(AGPL3)
provides=('murse' 'oflauncher' 'oflauncher-rei' 'oftoast')
makedepends=('git' 'go')
optdepends=("steam")
source=("git+https://git.sr.ht/~webb/murse")
sha256sums=('SKIP')

pkgver() {
  cd murse
  printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd murse
	CGO_ENABLED=0 go build -tags netgo -ldflags "-s -w" ./
	if [ "$(git rev-parse origin/master)" != "$(git rev-parse HEAD)" ]; then \
      complete-build; \
    fi
}

package() {
	cd murse
	install -Dm0755 murse -t "${pkgdir}"/usr/bin
}
