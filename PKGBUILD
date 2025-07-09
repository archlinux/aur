# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gnome-shell-extension-mosaic
_uuid=gnome-mosaic@jardon.github.com
pkgver=1.3.0
pkgrel=1
pkgdesc="GNOME window tiling extension"
arch=('any')
url="https://github.com/jardon/gnome-mosaic"
license=('GPL-3.0-or-later')
depends=(
  'gnome-shell'
  'xorg-xprop'
)
makedepends=('typescript')
optdepends=('gnome-shell-extensions: for Native Window Placment extension')
source=("gnome-mosaic-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
        '50_org.gnome.desktop.wm.keybindings.gnome-mosiac.gschema.override'
        '50_org.gnome.mutter.keybindings.gnome-mosaic.gschema.override'
        '50_org.gnome.mutter.wayland.keybindings.gnome-mosaic.gschema.override'
        '50_org.gnome.settings-daemon.plugins.media-keys.gnome-mosaic.gschema.override'
        '50_org.gnome.shell.keybindings.gnome-mosaic.gschema.override')
sha256sums=('d9e1e5733974db8b2729f1f822735396f3fd4b7c0210e0aaec6716df46a70874'
            '484bf48f12d2fa503c27ed34f6d190edb94ec844a0b49c6ff1bda872081e6b64'
            'f98115fbf502394ffb2eb2a38452a743ab087eadef7e009c62e93ee15c9f3849'
            'd3a4ac86303c9065fd76dace64283573079c3bdce4b9a2ca18be5f103eb6fd4c'
            'a6ed6eed9fba7ab0668caa5cb93f56152cd90e1047b4bdfd76dc5b5f8862b6fd'
            '7ebe94923b20c2bfc2382945ad635620f1b460c06e01694bb57074625414547e')

build() {
  cd "gnome-mosaic-$pkgver"
  make compile
}

package() {
  cd "gnome-mosaic-$pkgver"
  install -d "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}"
  cp -r _build/* "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/"

  install -Dm644 schemas/*.xml -t \
    "$pkgdir/usr/share/glib-2.0/schemas/"
  rm -rf "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/schemas"

  install -Dm644 SHORTCUTS.md -t "$pkgdir/usr/share/doc/$pkgname/"

  install -Dm644 "$srcdir"/*.gnome-mosaic.gschema.override -t \
    "$pkgdir/usr/share/glib-2.0/schemas/"
}
