# Maintainer: Amin Vakil <info at aminvakil dot com>
# Contributor: Rostyslav Nikolaienko <rostik.nikolaenko at gmail dot com>

_srcname=public-ip-gnome-extension
pkgname=gnome-shell-extension-public-ip-git
pkgver=r52.0aeee40
pkgrel=1
pkgdesc="Tiny extension, which show public IP and nothing more."
arch=('any')
url="https://github.com/rostegg/public-ip-gnome-extension"
license=('GPL3')
depends=('gnome-shell')
makedepends=('git')
conflicts=('gnome-shell-extension-public-ip')
provides=('gnome-shell-extension-public-ip')
source=("git+https://github.com/rostegg/${_srcname}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_srcname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${_srcname}"
  local uuid=$(grep -Po '(?<="uuid": ")[^"]*' $srcdir/${_srcname}/metadata.json)
  local destdir="$pkgdir/usr/share/gnome-shell/extensions/$uuid"
  install -dm755 "$destdir"
  cp -r $srcdir/${_srcname}/* "$destdir"
}
