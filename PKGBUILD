# Maintainer: Brent Mackey <bjdm.92 at gmail dot com>
pkgname='qml-lsp'
_reponame='qew-em-el-el-ess-pee'
pkgrel=1
pkgver=rjienrlwey.number.two.r10.ga426fd6
pkgdesc='QML Language Server'
arch=('x86_64')
url="https://invent.kde.org/cblack/$_reponame"
license=('GPLv3')
makedepends=('go' 'git')
provides=('qew-em-el-el-ess-pee')
conflicts=('qew-em-el-el-ess-pee')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd "$_reponame"
	( set -o pipefail
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

# prepare(){
# 	cd "$pkgname-$pkgver"
#   mkdir -p build/
# }

build() {
  cd "$_reponame"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o $pkgname ./cmd/...
}

# check() {
#   cd "$pkgname-$pkgver"
#   go test ./...
# }

package() {
  cd "$_reponame"
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
}
