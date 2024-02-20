# Maintainer: noraj <printf %s 'YWxleGFuZHJlLnphbm5pQGV1cm9wZS5jb20='|base64 -d>

pkgname=bcrypt-tool-git
_pkgname=bcrypt-tool
pkgver=v1.1.6.r0.g952d8e7
pkgrel=1
pkgdesc='A CLI tool for bcrypt - hash a password, determine if password matches a hash, compute cost of hash.'
arch=('x86_64' 'aarch64')
url='https://github.com/shoenig/bcrypt-tool'
license=('MIT')
depends=()
conflicts=('bcrypt-tool')
makedepends=('git' 'go')
source=("git+https://github.com/shoenig/$_pkgname")
sha512sums=('SKIP')

pkgver() {
  cd $_pkgname

  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
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
    -o $_pkgname .
}

package() {
  cd $_pkgname

  install -Dm 755 $_pkgname "$pkgdir/usr/bin/$_pkgname"
  install -Dm 644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}

