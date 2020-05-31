# Maintainer: jef <jeffreylec@gmail.com>

pkgname=gruvbox-tilix-git
pkgver=r.96f74f8
pkgrel=1
pkgdesc="Gruvbox theme for Tilix"
arch=("any")
url="https://github.com/MichaelThessel/tilix-gruvbox"
license=("GPL")
depends=("tilix>=1.5")
makedepends=("git")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+https://github.com/MichaelThessel/tilix-gruvbox.git")
md5sums=("SKIP")

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd "${srcdir}/${pkgname}"
  install -dm755 "$pkgdir/usr/share/tilix/schemes"
  install -Dm644 "gruvbox-dark-hard.json" "$pkgdir/usr/share/tilix/schemes"
  install -Dm644 "gruvbox-dark-medium.json" "$pkgdir/usr/share/tilix/schemes"
  install -Dm644 "gruvbox-dark-soft.json" "$pkgdir/usr/share/tilix/schemes"
  install -Dm644 "gruvbox-dark.json" "$pkgdir/usr/share/tilix/schemes"
  install -Dm644 "gruvbox-light-hard.json" "$pkgdir/usr/share/tilix/schemes"
  install -Dm644 "gruvbox-light-medium.json" "$pkgdir/usr/share/tilix/schemes"
  install -Dm644 "gruvbox-light-soft.json" "$pkgdir/usr/share/tilix/schemes"
}