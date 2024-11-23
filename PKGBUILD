#Maintainer: Maxb0tbeep <max@polygonal.place)
pkgname=bestfetch-git
pkgrel=1
pkgver=r65.ac98fb2
pkgdesc="a customizable, beautiful, and blazing fast system fetch, powered by nim"
arch=(x86_64)
url="https://gitlab.com/Maxb0tbeep/bestfetch"
license=('GPLv3')
makedepends=(nim git)
provides=(bestfetch)
conflicts=(bestfetch)
source=("git+https://gitlab.com/Maxb0tbeep/bestfetch")
md5sums=(SKIP)

pkgver() {
  cd "$srcdir/bestfetch"
  # Generate a version based on the latest commit hash
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/bestfetch"
	nimble build -d:release
}

package() {
	cd "$srcdir/bestfetch"
	install -Dm755 "build/bestfetch" "$pkgdir/usr/bin/bestfetch"
}
