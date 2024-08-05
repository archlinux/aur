# Maintainer: killab33z <killab33z @ protonmail-dot-com>
pkgname=netscout-git
_pkgname=netscout
pkgver=r37.2f409df
pkgrel=1
pkgdesc="OSINT tool that finds domains, subdomains, directories, endpoints and files..."
arch=('any')
url="https://github.com/caio-ishikawa/netscout"
license=('custom')
depends=('git' 'go')
provides=('netscout')
conflicts=('netscout' 'netscout-bin')
source=("git+$url")
sha512sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd $_pkgname
  go build -o netscout main.go
}

package() {
  install -Dm644 "$srcdir/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  install -Dm0755 $srcdir/$_pkgname/netscout "$pkgdir/usr/bin/netscout"
}

