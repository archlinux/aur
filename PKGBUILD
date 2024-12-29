# Contributor: aditya-K2 <adityakurdunkar2@gmail.com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=gspt-git
pkgver=r328.203df89
pkgrel=1
pkgdesc='Spotify for Terminal written in Go.'
arch=('x86_64')
url="https://github.com/aditya-K2/gspt"
license=('GPL-3.0-or-later')
makedepends=('git' 'go')
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  make -C "$pkgname" gspt
}

package() {
  install -Dm755 "$pkgname/bin/gspt" -t "$pkgdir/usr/bin"
}
