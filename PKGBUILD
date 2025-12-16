# Maintainer: Alexis Belmonte <alexbelm48@gmail.com>

_pkgname=kde-gruvbox
pkgname="${_pkgname}-git"
pkgver=r6.2dd9528
pkgrel=4
pkgdesc="A suite of Gruvbox themes for KDE"
arch=('any')
url="https://github.com/printesoi/kde-gruvbox"
license=('MIT')
makedepends=('git')
optdepends=(
  'plasma-workspace: Plasma desktop theme + color scheme support'
  'konsole: Konsole color scheme support'
  'yakuake: Yakuake skin support'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("${_pkgname}::git+https://github.com/printesoi/kde-gruvbox.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/${_pkgname}"

  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -dm755 "$pkgdir/usr/share/color-schemes"
  cp -a "color-schemes/." "$pkgdir/usr/share/color-schemes/"

  install -dm755 "$pkgdir/usr/share/konsole"
  cp -a "konsole/." "$pkgdir/usr/share/konsole/"

  install -dm755 "$pkgdir/usr/share/yakuake/skins"
  cp -a "yakuake/." "$pkgdir/usr/share/yakuake/skins/"

  install -dm755 "$pkgdir/usr/share/plasma/desktoptheme"
  cp -a "plasma5/." "$pkgdir/usr/share/plasma/desktoptheme/"
}
