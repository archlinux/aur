# Maintainer: RiverOnVenus <aur@zhui.dev>
pkgname=pkg.sh-git
pkgver=0.2.0.r0.g4d4c643
pkgrel=1
pkgdesc="A generalized package manager for whatever code"
arch=('any')
url="https://github.com/tidwall/pkg.sh"
license=('MIT')
depends=('bash')
provides=('pkg.sh')
conflicts=('pkg.sh')
makedepends=('git')
source=("$pkgname"::"git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  (
    set -o pipefail
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/-/.r/;s/-/./' \
      || printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

package() {
  install -Dm644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 "$srcdir/$pkgname/pkg.sh" "$pkgdir/usr/bin/pkg.sh"
}
