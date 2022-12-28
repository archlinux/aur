# Maintainer: coxackie

pkgname=gnome-shell-extension-no-annoyance-2-git
pkgver=r46.c6804a4
pkgrel=1
pkgdesc='Another extension, that removes the Window is ready notification and puts the window into focus.'
url='https://github.com/bdaase/noannoyance'
license=('GPL2')
arch=('any')
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
makedepends=('git' 'zip')
depends=('gnome-shell>=40')
source=("${pkgname}::git+${url}.git")
sha512sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$pkgname"
  uuid=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)
  destdir="$pkgdir/usr/share/gnome-shell/extensions/$uuid"
  install -dm755 "$destdir"
  install -dm755 "$destdir"/schemas
  install -Dm644 extension.js prefs.js metadata.json "$destdir"
  install -Dm644 schemas/* "$destdir"/schemas
}
