# Maintainer: Felipe BF <fprgw32 at gmail dot com>

_name=pmrp-ng
pkgname="${_name}-git"
pkgver=r8.3a9792a
pkgrel=1
pkgdesc="The next-generation successor of pmrp, allows for playing various internet radio stations in the terminal"
arch=('any')
url="https://github.com/hakerdefo/${_name}"
license=('MIT')
depends=('bash' 'curl' 'jq' 'mpv' 'fzf' 'util-linux')
makedepends=('git')

source=($pkgname::git+$url.git)
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd "$pkgname"
  install -Dm755 "${_name}" "$pkgdir/usr/bin/${_name}"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

