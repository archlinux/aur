# Maintainer: Simonqvq <simon@outlook.com>

pkgname=plymouth-theme-arch-slider-and-glow
pkgver=1
pkgrel=3
pkgdesc="Arch Linux themed Plymouth animation"
url="https://github.com/SimonQvQ/ArchSliderGlowPlymouth"
license=('MIT')
arch=('any')
depends=('plymouth')
makedepends=('git')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"

  local ver
  if ver="$(git describe --long --tags --abbrev=7 2>/dev/null)"; then
    ver="${ver#v}"
    ver="${ver//-/.}"
    printf '%s\n' "$ver"
    return
  fi

  printf 'r%s.%s\n' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$pkgname"

  install -d "$pkgdir/usr/share/plymouth/themes/arch-slider-and-glow"

  install -Dm644 arch-slider-and-glow.plymouth \
    "$pkgdir/usr/share/plymouth/themes/arch-slider-and-glow/arch-slider-and-glow.plymouth"

  find resources -type f -exec install -Dm644 '{}' \
    "$pkgdir/usr/share/plymouth/themes/arch-slider-and-glow/{}" \;

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
