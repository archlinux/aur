# Maintainer: Arkadiusz Lach <lach@includespark.eu>
pkgname=lyrics-git
pkgver=0
pkgrel=1
pkgdesc="lyrics CLI (git version)"
arch=('x86_64')
url="https://github.com/Oen44/lyrics"
license=('MIT')

depends=()
makedepends=('git' 'go')

provides=('lyrics')
conflicts=('lyrics')

source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"
  go build -trimpath -buildmode=pie -ldflags "-s -w" -o lyrics ./cmd/lyrics
}

check() {
  cd "${srcdir}/${pkgname}"
  go test ./...
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm755 lyrics "${pkgdir}/usr/bin/lyrics"
}