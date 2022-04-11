# Maintainer: Saren <saren@wtako.net>

pkgname=gnome-shell-extension-backslide-git
_pkgname="backslide"
pkgver=r144.d700daf
pkgrel=1
pkgdesc="A simple Gnome-Shell Extension for an automatic background-image (wallpaper) slideshow."
arch=('any')
url="https://bitbucket.org/LukasKnuth/backslide"
license=('GPL3')
depends=('dconf')
# makedepends=('git' 'gnome-common')
source=("git+https://bitbucket.org/LukasKnuth/backslide.git")
md5sums=('SKIP')
conflicts=('gnome-shell-extension-backslide-git')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"
  # Patch no longer needed as the fork supports up to 3.22.
  glib-compile-schemas "backslide@codeisland.org/schemas/"
}

package() {
  cd "$srcdir/$_pkgname"
  mkdir -p "$pkgdir/usr/share/gnome-shell/extensions"
  cp -r "backslide@codeisland.org" "$pkgdir/usr/share/gnome-shell/extensions/"
}
