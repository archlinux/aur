# Maintainer: Marvin1099
pkgname=wlpdisplays-git
pkgver=0.2.0.r0.ga70f6b5
pkgrel=1
pkgdesc="Print connected Wayland monitor information as JSON by parsing wayland-info output"
arch=('any')
url="https://codeberg.org/marvin1099/wlpdisplays"
license=('AGPL3')
depends=('python' 'wayland-utils')
makedepends=('git' 'python-pip')
source=("git+https://codeberg.org/marvin1099/wlpdisplays.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/wlpdisplays"
  git describe --long --tags --abbrev=7 2>/dev/null | \
    sed 's/^v//;s/-/.r/;s/-/./' || \
  printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/wlpdisplays"
  python -m pip install --root="$pkgdir" --prefix=/usr --no-build-isolation --no-deps .
  find "$pkgdir" -type d -name __pycache__ -exec rm -rf {} +
  find "$pkgdir" -type f -name direct_url.json -delete
}
