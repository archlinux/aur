# Maintainer: Justin Coffman <jcoffman@stlrwind.io>

pkgname=stimmtausch-git
pkgver=r246.575a286
pkgrel=1
pkgdesc="terminal-based MUCK client written in Go"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://stimmtausch.com"
license=('MIT')
makedepends=('go' 'git')
source=("$pkgname::git+https://github.com/makyo/${pkgname/-git/}.git")
b2sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${pkgname}"
  go build
}

package() {
  cd "${pkgname}"
  install -Dm755 "${pkgname%-*}" -t "${pkgdir}/usr/bin"
  install -Dm644 docs/cmd/*.1 -t "${pkgdir}/usr/share/man/man1"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname%-*}"
}
