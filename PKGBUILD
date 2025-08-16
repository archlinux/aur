# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: XZS <d dot f dot fischer at web dot de>
# Contributor: sanduhrs <stefan.auditor@erdfisch.de>
pkgname=gnome-shell-extension-caffeine-git
_uuid=caffeine@patapon.info
pkgver=57.r7.g9e93251
pkgrel=1
pkgdesc="Disable the screensaver and auto suspend"
arch=('any')
url="https://github.com/eonpatapon/gnome-shell-extension-caffeine"
license=('GPL-2.0-or-later')
depends=('gnome-shell')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/eonpatapon/gnome-shell-extension-caffeine.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname%-git}"
  make build
}

package() {
  cd "${pkgname%-git}"
  install -d "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}"
  bsdtar -xvf "${_uuid}.zip" -C \
    "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/" --no-same-owner

  mv -v "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/locale" "$pkgdir/usr/share"

  install -Dvm644 "${_uuid}"/schemas/*.gschema.xml -t "$pkgdir/usr/share/glib-2.0/schemas/"

  rm -rfv "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/schemas"
}
