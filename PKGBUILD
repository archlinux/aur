# Maintainer: asm0dey <pavel.finkelshtein@gmail.com>

pkgname=gitwrk-git
_pkgname=gitwrk
pkgver=v1.0.8.r0.g904fcd8
pkgrel=2
arch=('i686' 'x86_64')
url="https://github.com/unravela/gitwrk"
license=("MIT")

pkgdesc='GitWrk is a small CLI tool that helps you with monthly reports by extracting working hours directly from git repository.'

source=("$_pkgname::git://github.com/unravela/gitwrk.git")
sha512sums=('SKIP')
makedepends=('go' 'git')
provides=('gitwrk')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$_pkgname"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    go build -o $_pkgname ./cmd/
}

package() {
  cd $_pkgname
  install -Dm755 $_pkgname "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
