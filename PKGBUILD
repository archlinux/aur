# Maintainer: drakkan <nicola.murino at gmail dot com>
pkgbase=yaru
pkgname=('yaru-sound-theme' 'yaru-gtk-theme' 'yaru-gnome-shell-theme' 'yaru-icon-theme')
pkgver=18.10.4
pkgrel=4
_tag=r23
pkgdesc="Yaru default ubuntu theme"
arch=(any)
url="https://github.com/ubuntu/yaru"
license=('GPL3')

makedepends=('meson' 'sassc' 'git')
options=('!strip' '!buildflags' 'staticlibs')


source=("git+https://github.com/ubuntu/${pkgbase}#tag=${_tag}"
  "0001-gnome-shell-fix-install-dir.patch")
sha256sums=('SKIP'
  'c84e9720c47fc86eaf89ebc647bb656b13a3e79aa0b01c46734c5db013e42bc5')

prepare() {
  cd "${pkgbase}"

  patch -Np1 < ../0001-gnome-shell-fix-install-dir.patch
}

build() {
  arch-meson ${pkgbase} build
  ninja -C build
}

package_yaru-sound-theme() {
  pkgdesc="Yaru default ubuntu sound theme"  

  DESTDIR="$pkgdir" ninja -C build install
  rm -r "$pkgdir/usr/share/glib-2.0"
  rm -r "$pkgdir/usr/share/xsessions"
  rm -r "$pkgdir/usr/share/wayland-sessions"
  rm -r "$pkgdir/usr/share/icons"
  rm -r "$pkgdir/usr/share/themes"
}

package_yaru-gtk-theme() {
  pkgdesc="Yaru default ubuntu gtk theme"  
  depends=("gtk3" "gdk-pixbuf2" "gtk-engine-murrine" "gnome-themes-extra")
  
  DESTDIR="$pkgdir" ninja -C build install
  rm -r "$pkgdir/usr/share/glib-2.0"
  rm -r "$pkgdir/usr/share/xsessions"
  rm -r "$pkgdir/usr/share/wayland-sessions"
  rm -r "$pkgdir/usr/share/themes/Yaru/gnome-shell"
  rm -r "$pkgdir/usr/share/icons"
  rm -r "$pkgdir/usr/share/sounds"
}

package_yaru-gnome-shell-theme() {
  pkgdesc="Yaru default ubuntu gnome shell theme"  
  depends=("gnome-shell")
  
  DESTDIR="$pkgdir" ninja -C build install
  rm -r "$pkgdir/usr/share/glib-2.0"
  rm -r "$pkgdir/usr/share/xsessions"
  rm -r "$pkgdir/usr/share/wayland-sessions"
  rm -r "$pkgdir/usr/share/icons"
  rm -r "$pkgdir/usr/share/sounds"
  rm -r "$pkgdir/usr/share/themes/Yaru/gtk-2.0"
  rm -r "$pkgdir/usr/share/themes/Yaru/gtk-3.0"
  rm -r "$pkgdir/usr/share/themes/Yaru/index.theme"
  rm -r "$pkgdir/usr/share/themes/Yaru-dark"
}

package_yaru-icon-theme() {
  pkgdesc="Yaru default ubuntu icon theme"  
  depends=(hicolor-icon-theme gtk-update-icon-cache librsvg)

  DESTDIR="$pkgdir" ninja -C build install
  rm -r "$pkgdir/usr/share/glib-2.0"
  rm -r "$pkgdir/usr/share/xsessions"
  rm -r "$pkgdir/usr/share/wayland-sessions"
  rm -r "$pkgdir/usr/share/sounds"
  rm -r "$pkgdir/usr/share/themes"
}

# vim: ts=2 sw=2 et:
