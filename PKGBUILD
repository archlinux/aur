# Maintainer: lmartinez
pkgname=hydro-git
_pkgname=${pkgname%-git}
pkgver=r94.745837f
pkgrel=1
pkgdesc="Ultra-pure, lag-free Fish shell prompt with async git status"
arch=('any')
url="https://github.com/jorgebucaran/hydro"
license=('MIT')
groups=('fish-plugins')
depends=('fish')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$pkgname"
  install -Dm 644 conf.d/hydro.fish "$pkgdir/etc/fish/conf.d/hydro.fish"
  find functions -type f -exec install -Dm 644 '{}' "$pkgdir/etc/fish/{}" \;
  install -Dm 644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
