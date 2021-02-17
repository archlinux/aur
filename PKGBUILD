# Maintainer: TecTrixer <tonihoevedes@gmail.com>
pkgname=lyr-no-prompt-git
pkgver=0.1
pkgrel=1
epoch=
pkgdesc="A web scraper for genius.com to find lyrics for a given song without a prompt"
arch=(x86_64 i686 arm)
url="https://github.com/TecTrixer/lyr-no-prompt.git"
license=('MIT')
groups=()
depends=()
makedepends=(go git)
checkdepends=()
optdepends=()
provides=()
conflicts=(lyr-no-prompt-git)
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url")
noextract=()
md5sums=('SKIP')
validpgpkeys=()
prepare() {
	cd "lyr-no-prompt"
	printf "4.9.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "lyr-no-prompt"
	mkdir -p build/
	export CGO_CPPFLAGS="${CPPFLAGS}"
  	export CGO_CFLAGS="${CFLAGS}"
  	export CGO_CXXFLAGS="${CXXFLAGS}"
  	export CGO_LDFLAGS="${LDFLAGS}"
  	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  	go build -o build
}

package() {
  cd "lyr-no-prompt"
  install -Dm755 build/lyr "$pkgdir"/usr/bin/lyr-no-prompt
}
