# Maintainer: Kirill I <elephanttalk+aur [at] protonmail _dot_ com>

pkgname=reflectortk-git
pkgver=r2.f8e83c8
pkgrel=1
pkgdesc="Simple GUI for selecting pacman mirrors using reflector (git version)."
arch=('any')
license=('GPL-2.0-or-later')
url='https://github.com/indiscipline/reflectortk'

depends=(
  reflector
  python
  polkit
)

makedepends=(
  'git'
)

provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")

source=(
  "reflectortk::git+$url.git"
)

sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"

  ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

package() {
  cd "$srcdir/${pkgname%-git}"

  install -d "$pkgdir"/usr/bin
  install -d "$pkgdir"/usr/share/applications

  install -Dm755 "${pkgname%-git}.py" "$pkgdir/usr/bin/${pkgname%-git}"
  install -Dm644 "${pkgname%-git}.desktop" "$pkgdir/usr/share/applications/${pkgname%-git}.desktop"
}
