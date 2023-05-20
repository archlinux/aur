# Maintainer: Jason Kölker <jason@koelker.net>
# Contributor: Oliver Papst <op3@mailbox.org>

pkgname=gnome-shell-extension-vertical-overview-gdh-fork-git
pkgdesc='Gnome 44 Vertical workspaces'
url='https://github.com/G-dH/vertical-workspaces'
pkgver=v6.r0.g832fb87
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
  cd "${pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${pkgname}"
  uuid=$(jq -r '.uuid' metadata.json)
  destdir="${pkgdir}/usr/share/gnome-shell/extensions/${uuid}"
  install -dm755 "${destdir}"
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
  install -Dm644 -t "${pkgdir}/usr/share/glib-2.0/schemas" \
      schemas/org.gnome.shell.extensions.vertical-overview.gschema.xml
  cp -a ./*.js ./*.ui ./metadata.json "${destdir}"
}
