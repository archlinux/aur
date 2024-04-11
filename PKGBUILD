# Maintainer: libele <libele@disroot.org>

pkgname=vilearn-git
_pkgname=vilearn
pkgver=1.2.r0.g00ee4a4
pkgrel=1
pkgdesc="An interactive vi tutorial (git version)"
arch=('any')
url="https://git.sr.ht/~libele/vilearn"
license=('custom:Copyright')
makedepends=('bmake' 'git')
optdepends=('vi: the original ex/vi text editor')
provides=('vilearn')
conflicts=('vilearn')
source=("git+https://git.sr.ht/~libele/vilearn")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' || \
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

package() {
  cd "$_pkgname"

  bmake DESTDIR="$pkgdir" PREFIX=/usr install
  install -Dm644 README.md "$pkgdir"/usr/share/vilearn/README
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/vilearn/LICENSE
}
