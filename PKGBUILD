# Maintainer: Jens John <dev@2ion.de>
pkgname=bunsen-exit-ng-git
pkgver=r21.d42a606
pkgrel=2
pkgdesc="Configurable selection menu based on dmenuv"
arch=('any')
url="https://github.com/2ion/bunsen-exit-ng"
license=('GPL')
depends=('bash' 'dmenuv' 'coreutils')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('bunsen-exit-ng::git+https://github.com/2ion/bunsen-exit-ng.git#branch=dmenuv')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

check() {
  cd "$srcdir/${pkgname%-git}"
  bash -n bunsen-exit-ng
}

package() {
  cd "$srcdir/${pkgname%-git}"
  install -Dm755 bunsen-exit-ng "${pkgdir}/usr/bin/bunsen-exit-ng"
  install -Dm755 dmenuv_run "${pkgdir}/usr/bin/dmenuv_run"
  install -Dm644 exitrc "${pkgdir}/usr/share/doc/bunsen-exit-ng/exitrc.example"
  install -Dm644 README "${pkgdir}/usr/share/doc/bunsen-exit-ng/README"
}
