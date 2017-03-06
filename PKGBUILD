# Maintainer: Patrick Wozniak <hello@patwoz.de>

pkgname=openbox-arc-git
pkgver=20170306.r18.d6bfa0e
pkgrel=1
pkgdesc="An attempt to create Openbox themes to fit with the rest of the Arc theme. (git)"

arch=('any')
url="https://github.com/dglava/arc-openbox"
license=('GPL3')

depends=(
  'openbox'
)
makedepends=(
  'git'
)

conflicts=()
backup=()

source=(
  "$pkgname::git+$url.git#branch=master"
)
sha256sums=(
  'SKIP'
)

pkgver() {
  cd "$pkgname"
  printf "%s.r%s.%s" "$(date +%Y%m%d)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$pkgname"

  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  mkdir -p ${pkgdir}/usr/share/themes
  ls | grep -e '^Arc' | xargs cp -R -t "${pkgdir}/usr/share/themes"
}
