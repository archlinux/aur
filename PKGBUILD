# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gnome-shell-extension-space-bar-git
_uuid=space-bar@luchrioh
pkgver=22.r7.g89a4149
pkgrel=2
pkgdesc="GNOME Shell extension that shows workspaces buttons in top panel"
arch=('any')
url="https://github.com/christopher-l/space-bar"
license=('unknown')
depends=('gnome-shell')
makedepends=('git' 'typescript')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/christopher-l/space-bar.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/space-bar"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/space-bar"
  sh scripts/build.sh
}

package() {
  cd "$srcdir/space-bar"
  install -d "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}"
  bsdtar -xvf "${_uuid}.shell-extension.zip" -C \
    "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/" --no-same-owner

  install -Dm644 target/schemas/org.gnome.shell.extensions.space-bar.gschema.xml -t \
    "$pkgdir/usr/share/glib-2.0/schemas/"
  rm -rf "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/schemas"
}
