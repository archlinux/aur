# Maintainer: lmartinez-mirror
pkgname=fish-fastdir-git
_pkgname=${pkgname%-git}
pkgver=r6.4f616a6
pkgrel=1
pkgdesc="Fast directory navigation for fish"
arch=('any')
url="https://github.com/danhper/fish-fastdir"
license=('unknown')
groups=('fish-plugins')
depends=('fish')
makedepends=('git')
provides=("$_pkgname")
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$pkgname"
  mv init.fish "${_pkgname}-init.fish"
}

package() {
  cd "$pkgname"
  install -Dm644 "${_pkgname}-init.fish" -t "$pkgdir/etc/fish/conf.d/"
  find functions -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/fish/{}" \;
}

