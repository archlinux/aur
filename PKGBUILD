# Maintainer: Ogolknev Nikita <ogolknevnv@ya.ru>
pkgname=goxray-cli-git
pkgver=0.0.8.0.g5c8f308
pkgrel=1
pkgdesc="CLI Xray VPN client"
arch=('x86_64' 'aarch64')
url="https://github.com/goxray/tun"
license=('GPL3')
depends=('glibc')
makedepends=('go' 'git')
provides=('goxray-cli')
conflicts=('goxray-cli')
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --tags --long 2>/dev/null \
    | sed 's/^v//;s/-/./g' \
    || printf "0.0.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  go build -trimpath -mod=readonly -o goxray-cli .
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 goxray-cli "$pkgdir/usr/bin/goxray-cli"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
