# Based on: https://aur.archlinux.org/packages/gnome-shell-extension-clipboard-indicator
# Maintainer: Ľubomír 'the-k' Kučera <lubomir.kucera.jr at gmail.com>
_pkgname=gnome-shell-extension-clipboard-indicator
_uuid=("clipboard-indicator@tudmotu.com")
pkgname="${_pkgname}-lubo"
pkgver=64
pkgrel=3
pkgdesc="The most popular clipboard manager for GNOME, always up-to-date"
arch=("any")
url="https://github.com/Tudmotu/gnome-shell-extension-clipboard-indicator"
license=("MIT")
depends=("gnome-shell>=46.0")
conflicts=(
  "${_pkgname}"
  "gnome-shell-extension-clipboard-history"
)
source=(
  "${_pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
  support-current-gnome.patch
)
sha256sums=(
  759fae6d9be4b41d410c7eab117667c6aa41415712963624da453d5d4be909b5
  SKIP
)

prepare() {
  cd "${_pkgname}-${pkgver}"

  patch -p0 < ../support-current-gnome.patch
}

package() {
  install -d "$pkgdir/usr/share/gnome-shell/extensions" \
    && cp -a "$srcdir/$_pkgname-$pkgver/." "$_/$_uuid"

  install -d "$pkgdir/usr/share/glib-2.0" \
    && cp -a "$pkgdir/usr/share/gnome-shell/extensions/$_uuid/schemas" "$_"

  rm -f "$pkgdir/usr/share/glib-2.0/schemas/gschemas.compiled"
}
