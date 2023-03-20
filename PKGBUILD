# Maintainer: Mattia Borda <mattiagiovanni.borda@icloud.com>

pkgname=gnome-shell-extension-background-logo
_name=background-logo-extension
pkgver=44.0
pkgrel=1
pkgdesc='GNOME Shell extension to overlay a logo over the default background'
arch=(any)
url=https://pagure.io/$_name
depends=(gnome-shell)
source=(git+$url#tag=$pkgver https://sources.archlinux.org/other/artwork/archlinux-logo-white-scalable.svg)
sha256sums=('SKIP'
            '80ed897a3d1d5ad709147a97572d062abcdc61487d3d1f8882b8b1373943fe15')
license=(GPL3)
makedepends=(git meson)

prepare() {
  sed -i 's#/usr/share/fedora-logos/fedora_lightbackground.svg#/usr/share/gnome-shell/extensions/background-logo@fedorahosted.org/archlinux-logo.svg#;s#/usr/share/fedora-logos/fedora_darkbackground.svg#/usr/share/gnome-shell/extensions/background-logo@fedorahosted.org/archlinux-logo.svg#' $_name/schemas/org.fedorahosted.$_name.gschema.xml
}

build() {
  arch-meson $_name build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
  install -Dm644 ../archlinux-logo-white-scalable.svg -t "$pkgdir"/usr/share/gnome-shell/extensions/background-logo@fedorahosted.org
}
