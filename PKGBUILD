# Maintainer: asm0dey <pavel.finkelshtein@gmail.com>

pkgname=gitwrk-git
_pkgname=gitwrk
pkgver=v1.0.11.r3.gd3a53e2
pkgrel=1
arch=('i686' 'x86_64')
url="https://github.com/sn3d/gitwrk"
license=("MIT")

pkgdesc='GitWrk is a small CLI tool that helps you with monthly reports by extracting working hours directly from git repository.'

source=("$_pkgname::git+https://github.com/sn3d/gitwrk.git")
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
    go build -o $_pkgname ./cmd/gitwrk/
}

package() {
  cd $_pkgname
  install -Dm755 $_pkgname "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
