# Maintainer: ultraviolet <ultravioletnanokitty@gmail.com>

pkgname=gnome-shell-extension-backslide-git
_pkgname="backslide"
pkgver=r93.7e36a49
pkgrel=2
pkgdesc="A GNOME Shell extension to cycle between wallpapers over time"
arch=('any')
url="https://bitbucket.org/LukasKnuth/backslide"
license=('GPL3')
depends=('dconf')
makedepends=('git' 'gnome-common')
source=("git+https://bitbucket.org/LukasKnuth/backslide.git" "0001-metadata.patch")
md5sums=('SKIP' 'bfe7f9d72d99a9ef0f0e4e0207e3b358')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"
  # the metadata.json in git currently does not list 3.14 as a compatible
  # gnome shell version. this version is compatible with the extension,
  # however, so we patch metadata.json to include it.
  patch -p1 "backslide@codeisland.org/metadata.json" < ../../0001-metadata.patch
  glib-compile-schemas "backslide@codeisland.org/schemas/"
}

package() {
  cd "$srcdir/$_pkgname"
  mkdir -p "$pkgdir/usr/share/gnome-shell/extensions"
  cp -r "backslide@codeisland.org" "$pkgdir/usr/share/gnome-shell/extensions/"
}
