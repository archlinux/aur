# Maintainer: Ranieri Althoff <ranisalt+aur at gmail dot com>

pkgname=gnome-shell-extension-no-annoyance-git
pkgver=r23.e37b5b3
pkgrel=1
pkgdesc='Removes the “Window is ready” notification and puts the window into focus'
url='https://github.com/BjoernDaase/noannoyance'
license=('GPL2')
arch=('any')
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
makedepends=('git' 'zip')
depends=('gnome-shell>=3.30')
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
  install -Dm644 extension.js metadata.json "$destdir"
}
