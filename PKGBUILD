# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: XZS <d dot f dot fischer at web dot de>
# Contributor: sanduhrs <stefan.auditor@erdfisch.de>
pkgname=gnome-shell-extension-caffeine-git
_uuid=caffeine@patapon.info
pkgver=50.r2.g3c9a447
pkgrel=2
pkgdesc="Disable the screensaver and auto suspend"
arch=('any')
url="https://github.com/eonpatapon/gnome-shell-extension-caffeine"
license=('GPL2')
depends=('gnome-shell')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/eonpatapon/gnome-shell-extension-caffeine.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/${pkgname%-git}"
  make build
}

package() {
  cd "$srcdir/${pkgname%-git}"
  install -d "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}"
  bsdtar -xvf "${_uuid}.zip" -C \
    "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/"

  mv "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/locale" "$pkgdir/usr/share"

  install -Dm644 "${_uuid}/schemas/org.gnome.shell.extensions.caffeine.gschema.xml" -t \
    "$pkgdir/usr/share/glib-2.0/schemas/"

  rm -rf "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/schemas"
}
