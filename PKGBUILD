# Maintainer: Xavier Francisco <echo moc.liamg@ocsicnarf.n.reivax | rev>

pkgname=mufasasays-git
pkgver=r8.9e8c648
pkgrel=1
pkgdesc="Display Lion King wisdom from Mufasa using cowsay"
arch=('any')
url="https://github.com/Qu4tro/mufasaSays"
license=('MIT')
depends=('bash' 'cowsay')
makedepends=('git')
provides=('mufasasays')
conflicts=('mufasasays')
source=("${pkgname%-git}::git+https://github.com/Qu4tro/mufasaSays.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${pkgname%-git}"

  # Install script with patched cow path (moofasa.cow is included in cowsay)
  install -Dm755 mufasaSays "$pkgdir/usr/bin/mufasaSays"
  sed -i 's|"\$SCRIPT_DIR/moofasa.cow"|moofasa|' "$pkgdir/usr/bin/mufasaSays"
  sed -i '/^SCRIPT_DIR=/d' "$pkgdir/usr/bin/mufasaSays"

  # Install license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
