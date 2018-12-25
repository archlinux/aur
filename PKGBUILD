# Maintainer: drakkan <nicola.murino at gmail dot com>
pkgbase=yaru
pkgname=('yaru-sound-theme' 'yaru-gtk-theme' 'yaru-gnome-shell-theme' 'yaru-icon-theme' 'yaru-session')
pkgver=18.10.7
pkgrel=3
_tag=18.10.7
pkgdesc="Yaru default ubuntu theme"
arch=(any)
url="https://github.com/ubuntu/yaru"
license=('GPL3')

makedepends=('meson' 'sassc' 'git')
options=('!strip' '!buildflags' 'staticlibs')


source=("git+https://github.com/ubuntu/${pkgbase}#tag=${_tag}")
sha256sums=('SKIP')

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
  rm -r "$pkgdir/usr/share/gnome-shell"
}

package_yaru-gtk-theme() {
  pkgdesc="Yaru default ubuntu gtk theme"  
  depends=("gtk3" "gdk-pixbuf2" "gtk-engine-murrine" "gnome-themes-extra")
  
  DESTDIR="$pkgdir" ninja -C build install
  rm -r "$pkgdir/usr/share/glib-2.0"
  rm -r "$pkgdir/usr/share/xsessions"
  rm -r "$pkgdir/usr/share/wayland-sessions"
  rm -r "$pkgdir/usr/share/icons"
  rm -r "$pkgdir/usr/share/sounds"
  rm -r "$pkgdir/usr/share/gnome-shell"
}

package_yaru-gnome-shell-theme() {
  pkgdesc="Yaru default ubuntu gnome shell theme"  
  depends=("gnome-shell" "yaru-session")
  
  DESTDIR="$pkgdir" ninja -C build install
  rm -r "$pkgdir/usr/share/glib-2.0"
  rm -r "$pkgdir/usr/share/xsessions"
  rm -r "$pkgdir/usr/share/wayland-sessions"
  rm -r "$pkgdir/usr/share/icons"
  rm -r "$pkgdir/usr/share/sounds"
  rm -r "$pkgdir/usr/share/themes"
}

package_yaru-icon-theme() {
  pkgdesc="Yaru default ubuntu icon theme"  
  depends=("hicolor-icon-theme" "gtk-update-icon-cache" "librsvg" "humanity-icon-theme")

  DESTDIR="$pkgdir" ninja -C build install
  rm -r "$pkgdir/usr/share/glib-2.0"
  rm -r "$pkgdir/usr/share/xsessions"
  rm -r "$pkgdir/usr/share/wayland-sessions"
  rm -r "$pkgdir/usr/share/sounds"
  rm -r "$pkgdir/usr/share/themes"
  rm -r "$pkgdir/usr/share/gnome-shell"
}

package_yaru-session() {
  pkgdesc="Yaru session"
  depends=("gnome-shell")

  DESTDIR="$pkgdir" ninja -C build install
  rm -r "$pkgdir/usr/share/sounds"
  rm -r "$pkgdir/usr/share/themes"
  rm -r "$pkgdir/usr/share/gnome-shell"
  rm -r "$pkgdir/usr/share/icons"
}


# vim: ts=2 sw=2 et:
