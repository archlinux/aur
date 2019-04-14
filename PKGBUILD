# Maintainer: Denys Pavlov <me at denys dot me>
pkgname=1pass-git
_pkgname=1pass
pkgver=r68.93e14d8
pkgrel=1
pkgdesc="A caching wrapper for the 1Password CLI"
arch=('any')
url="https://github.com/dcreemer/1pass.git"
license=('GPL3')
depends=('1password-cli' 'jq' 'gnupg')
makedepends=('git')
optdepends=()
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$pkgname::git+https://github.com/dcreemer/1pass.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd "$pkgname"
  sharepath="${pkgdir}/usr/share"

  install -m 755 -D 1pass "$pkgdir/usr/bin/1pass"
  install -m 644 -D 1pass.el "$pkgdir/usr/share/emacs/site-lisp/$pkgname/1pass.el"
  install -m 644 -D fuzzpass.fish "$pkgdir/usr/share/fish/vendor_functions.d/fuzzpass.fish"
  install -m 644 -D fuzzpass.sh "$pkgdir/usr/share/1pass/fuzzpass.sh"
  install -m 644 -D config.sample "$pkgdir/usr/share/1pass/config.sample"
}

# vim:set ts=2 sw=2 et:
