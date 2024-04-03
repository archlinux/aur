# Maintainer: Frederik “Freso” S. Olesen <archlinux@freso.dk>
_pkgname=fisher_path.fish
pkgname="fish-${_pkgname%.fish}-git"
pkgver=r8.2f70474
pkgrel=1
pkgdesc='Fish shell plugin for automatically loading plugins under `$fisher_path`'
arch=(any)
url="https://github.com/kidonng/$_pkgname"
license=('MIT')
depends=(
  'fish'
  'fisher'
)
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url.git")
b2sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm644 -t "$pkgdir"/usr/share/fish/vendor_conf.d conf.d/fisher_path.fish
  install -Dm644 -t "$pkgdir"/usr/share/licenses/"${pkgname%-git}" LICENSE
  install -Dm644 -t "$pkgdir"/usr/share/doc/"${pkgname%-git}" README.md
}
