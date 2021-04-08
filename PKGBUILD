# Maintainer: Jason Kölker <jason@koelker.net>

pkgname=gnome-shell-extension-vertical-overview-git
pkgdesc='Gnome 40 Vertical workspaces'
url='https://github.com/RensAlthuis/vertical-overview'
pkgver=0+9943e5e21fa5
pkgrel=1
license=('GPL2')
arch=('any')
depends=(gnome-shell)
makedepends=('git' 'jq')
source=(
    "${pkgname}::git+${url}.git"
)
sha256sums=(
    'SKIP'
)

pkgver() {
  cd "$pkgname"
  echo 0+$(git rev-parse --short HEAD)
}

package() {
  cd "$pkgname"
  uuid=$(jq -r '.uuid' metadata.json)
  destdir="$pkgdir/usr/share/gnome-shell/extensions/$uuid"
  install -dm755 "$destdir"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  install -Dm644 -t "$pkgdir/usr/share/glib-2.0/schemas" \
      schemas/org.gnome.shell.extensions.vertical-overview.gschema.xml
  cp -a ./*.js ./*.ui ./metadata.json "$destdir"
}
