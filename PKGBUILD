# Maintainer: Daniel Streba <daniel at streba dot io>

pkgname=tkp-git
pkgver=r18.ec425c8
pkgrel=1
pkgdesc="Simple titlebar color changer for KDE"
arch=('any')
url="https://github.com/siggsy/Tkp"
license=('unknown')
depends=(
  'xorg-xprop'
  'kcolorchooser'
  'bc'
  'xorg-server' # needs X11 session
  'breeze' # needs Breeze color scheme
  'kwin' # needs supported window manager for window decorations
  'kconfig' # needs 'kwriteconfig5' and 'kreadconfig5' command
  'qt5-tools' # needs 'qdbus' command
)
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('tkp::git+https://github.com/siggsy/Tkp')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd "$srcdir/${pkgname%-git}"
  install -Dm755 tkp "${pkgdir}/usr/bin/tkp"
}
