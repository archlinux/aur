# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgbase=lua-lunacolors-git
pkgname=lua51-lunacolors-git
pkgver=r9.004bca9
pkgrel=1
pkgdesc="ANSI colors library for Lua"
arch=('any')
url="https://github.com/hilbis/lunacolors"
license=('BSD')
depends=('lua51')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgbase::git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgbase"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$pkgbase"
  install -Dvm 644 lunacolors.lua -t "$pkgdir/usr/share/lua/5.1/"
  ## Redirects Lua to the right directory while also not needing to depend on Hilbish
  mkdir -p "$pkgdir/usr/local/share/lua/5.1/"
  ln -s "/usr/share/lua/5.1/lunacolors.lua" "$pkgdir/usr/local/share/lua/5.1/lunacolors.lua"
  install -Dvm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
