# Maintainer: Saren <saren@wtako.net>

pkgname=gnome-shell-extension-backslide-3.18-git
_pkgname="backslide"
pkgver=r96.f04ccaf
pkgrel=1
pkgdesc="A GNOME Shell extension to cycle between wallpapers over time. Supports gnome shell 3.14, 3.16, 3.18 and 3.20."
arch=('any')
url="https://bitbucket.org/p91paul/backslide"
license=('GPL3')
depends=('dconf')
makedepends=('git' 'gnome-common')
source=("git+https://bitbucket.org/p91paul/backslide.git")
md5sums=('SKIP')
conflicts=('gnome-shell-extension-backslide-git')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"
  # Patch no longer needed as the fork supports 3.14, 3.16 and 3.18. 
  glib-compile-schemas "backslide@codeisland.org/schemas/"
}

package() {
  cd "$srcdir/$_pkgname"
  mkdir -p "$pkgdir/usr/share/gnome-shell/extensions"
  cp -r "backslide@codeisland.org" "$pkgdir/usr/share/gnome-shell/extensions/"
}
