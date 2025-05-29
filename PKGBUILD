# Maintainer: noraj <printf %s 'YWxleGFuZHJlLnphbm5pQGV1cm9wZS5jb20='|base64 -d>

pkgname=hexxy-git
_pkgname=hexxy
pkgver=31.8833335
pkgrel=1
pkgdesc='A modern and beautiful alternative to xxd and hexdump.'
arch=('x86_64' 'aarch64')
url='https://github.com/sweetbbak/hexxy'
license=('MIT')
depends=()
makedepends=('git' 'go')
conflicts=('hexxy')
source=("git+https://github.com/sweetbbak/$_pkgname.git")
sha512sums=('SKIP')

pkgver() {
  cd $_pkgname

  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd $_pkgname

  GOPATH="$srcdir" go mod download
  GOPATH="$srcdir" go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-s -w" \
    -o $_pkgname ./cmd/$_pkgname
}

package() {
  cd $_pkgname

  install -Dm 755 $_pkgname "$pkgdir/usr/bin/$_pkgname"
  install -Dm 644 -t "$pkgdir/usr/share/doc/$_pkgname/" README.md
}

