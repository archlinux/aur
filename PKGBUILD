# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gnome-shell-extension-space-bar-git
_uuid=space-bar@luchrioh
pkgver=33.r0.gb228b3a
pkgrel=1
pkgdesc="GNOME Shell extension that shows workspaces buttons in top panel"
arch=('any')
url="https://github.com/christopher-l/space-bar"
license=('LicenseRef-unknown')
depends=('gnome-shell')
makedepends=('git' 'typescript')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/christopher-l/space-bar.git')
sha256sums=('SKIP')

pkgver() {
  cd space-bar
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd space-bar
  sh scripts/build.sh
}

package() {
  cd space-bar
  install -d "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}"
  bsdtar -xvf "${_uuid}.shell-extension.zip" -C \
    "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/" --no-same-owner

  install -Dm644 target/schemas/org.gnome.shell.extensions.space-bar.gschema.xml -t \
    "$pkgdir/usr/share/glib-2.0/schemas/"
  rm -rf "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/schemas"
}
