# Maintainer: Saren <saren@wtako.net>

pkgname=gnome-shell-extension-backslide-git
_pkgname="BackSlide"
pkgver=r171.5b3436f
pkgrel=2
pkgdesc="A simple Gnome-Shell Extension for an automatic background-image (wallpaper) slideshow."
arch=('any')
url="https://gitlab.com/p91paul/BackSlide"
license=('GPL3')
depends=('dconf')
# makedepends=('git' 'gnome-common')
source=("git+https://gitlab.com/p91paul/BackSlide.git")
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
