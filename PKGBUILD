# Maintainer: m6audereo <m6audereo.4444@gmail.com>

pkgname=brrtfetch-git
_pkgname=brrtfetch
pkgver=r21.ebe8634
pkgrel=1
pkgdesc="Render animated GIFs as ASCII in your fetcher of choice. Written in go."
arch=(x86_64 aarch64)
url="https://github.com/ferrebarrat/brrtfetch"
license=(MIT)
depends=(expect fastfetch)
makedepends=(go git)
optdepends=(
	'neofetch: system fetcher alternative'
	'hyfetch: system fetcher alternative'
	'screenfetch: system fetcher alternative'
	'bsdutils: sysinfo color support'
)
source=("brrtfetch::git+https://github.com/ferrebarrat/brrtfetch.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	cd "$_pkgname"
	go build -trimpath -o ./brrtfetch ./go/main.go
	chmod +x ./brrtfetch
}

package() {
	cd "$_pkgname"
	install -Dm755 ./brrtfetch "$pkgdir/usr/bin/$_pkgname"
}
