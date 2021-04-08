# Maintainer: Jason Kölker <jason@koelker.net>

pkgname=gnome-shell-extension-nothing-to-say-git
pkgdesc='keeps your microphone muted, unless you have something to say'
url='https://github.com/wbolster/nothing-to-say'
pkgver=10+4+g473782fbe67b
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
  git describe --long --tags | sed 's/^v//; s/-/+/g'
}

package() {
  cd "$pkgname"
  uuid=$(jq -r '.uuid' metadata.json)
  destdir="$pkgdir/usr/share/gnome-shell/extensions/$uuid"
  install -dm755 "$destdir"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  install -Dm644 -t "$pkgdir/usr/share/glib-2.0/schemas" \
      schemas/org.gnome.shell.extensions.nothing-to-say.gschema.xml
  cp -a ./*.js ./metadata.json "$destdir"
}
