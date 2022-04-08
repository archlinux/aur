# Maintainer: Michael Schubert <mschu. dev at gmail> github.com/mschubert/PKGBUILDs
# Contributor: Maxim Andersson <thesilentboatman@gmail.com>
_pkgname=drop-down-terminal
_uuid='drop-down-terminal@gs-extensions.zzrough.org'
_gitname=gs-extensions-$_pkgname

pkgname=gnome-shell-extension-$_pkgname-git
pkgver=24.r10.g91ab851
pkgrel=3
pkgdesc="Drop Down Terminal extension for the Gnome Shell"
arch=('any')
url="https://github.com/zzrough/$_gitname"
license=('GPL3')
depends=('gnome-shell')
makedepends=('git')
provides=('gnome-shell-extension-drop-down-terminal')
conflicts=('gnome-shell-extension-drop-down-terminal')
install=$_pkgname.install
source=(git+https://github.com/ccat3z/$_gitname)
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir"/$_gitname
  git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  sed -i '/shell-version/s|"],|", "41", "42"],|' "$srcdir"/$_gitname/$_uuid/metadata.json
}

package() {
  install -dm755 "$pkgdir"/usr/share/gnome-shell/extensions
  install -dm755 "$pkgdir"/usr/share/glib-2.0/schemas

  cd "$srcdir"/$_gitname
  mv $_uuid/org.zzrough.gs-extensions.drop-down-terminal.gschema.xml \
    "$pkgdir"/usr/share/glib-2.0/schemas/
  cp -af $_uuid "$pkgdir"/usr/share/gnome-shell/extensions/
}
