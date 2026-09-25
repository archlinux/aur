# Maintainer: noraj <printf %s 'YWxleGFuZHJlLnphbm5pQGV1cm9wZS5jb20='|base64 -d>

pkgname=golang-jwt
_projectname=jwt
pkgver=5.3.1
pkgrel=1
pkgdesc='Go JWT simple CLI to sign, verify and show tokens.'
arch=('x86_64' 'aarch64')
url='https://golang-jwt.github.io/jwt/'
license=('MIT')
depends=()
makedepends=('go')
source=("https://github.com/$pkgname/$_projectname/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('e730a0aae7af5243016ac71290687b41b185a01956c2690ca4c8a7ec9fd9a3d8f57d4a0ce4a8b8e633ee313662b0d9a622a72d86ae8c1c541946a7fe85f3284b')
conflicts=('golang-jwt-git')
provides=('golang-jwt')

build() {
  cd "$_projectname-$pkgver"

  GOPATH="$srcdir" go mod download
  GOPATH="$srcdir" go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-s -w" \
    -o $_projectname ./cmd/$_projectname
}

package() {
  cd "$_projectname-$pkgver"

  install -Dm 755 $_projectname "$pkgdir/usr/bin/$pkgname"
  install -Dm 644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

