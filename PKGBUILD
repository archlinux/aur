# Maintainer: lmartinez
pkgname=hexokinase-git
_pkgname=${pkgname%-git}
pkgver=r44.11fc3ef
pkgrel=1
pkgdesc="Fast text scraper for converting colors into hex values"
arch=('x86_64')
url="https://github.com/rrethy/hexokinase"
license=('MIT')
depends=('glibc')
optdepends=('vim-hexokinase: companion vim plugin')
makedepends=('git' 'go')
provides=("$_pkgname")
source=("git+$url")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkgname"
  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\""
}

package() {
  cd "$_pkgname"
  install -Dm755 hexokinase "$pkgdir/usr/bin/hexokinase"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
