# Maintainer: drakkan <nicola.murino at gmail dot com>
pkgbase=yaru
pkgname=('yaru-sound-theme' 'yaru-gtk-theme' 'yaru-gnome-shell-theme' 'yaru-icon-theme')
pkgver=b589893d
pkgrel=4
_gitname=yaru
pkgdesc="Yaru default ubuntu theme"
arch=(any)
url="https://github.com/ubuntu/yaru"
license=('GPL3')

makedepends=('meson' 'sassc' 'git')
options=('!strip' '!buildflags' 'staticlibs')
conflicts=('yaru')

source=("$_gitname::git://github.com/ubuntu/$_gitname")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${_gitname}"
  printf "%s" "$(git describe --always --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  arch-meson ${_gitname} build
  ninja -C build
}

package_yaru-sound-theme() {
  pkgdesc="Yaru default ubuntu sound theme"  

  DESTDIR="$pkgdir" meson install -C build
  rm -r "$pkgdir/usr/share/glib-2.0"
  rm -r "$pkgdir/usr/share/xsessions"
  rm -r "$pkgdir/usr/share/wayland-sessions"
  rm -r "$pkgdir/usr/share/gnome-shell"
  rm -r "$pkgdir/usr/share/icons"
  rm -r "$pkgdir/usr/share/themes"
}

package_yaru-gtk-theme() {
  pkgdesc="Yaru default ubuntu gtk theme"  
  depends=("gtk3")
  optdepends=("gtk2")
  
  DESTDIR="$pkgdir" meson install -C build
  rm -r "$pkgdir/usr/share/glib-2.0"
  rm -r "$pkgdir/usr/share/xsessions"
  rm -r "$pkgdir/usr/share/wayland-sessions"
  rm -r "$pkgdir/usr/share/gnome-shell"
  rm -r "$pkgdir/usr/share/icons"
  rm -r "$pkgdir/usr/share/sounds"
}

package_yaru-gnome-shell-theme() {
  pkgdesc="Yaru default ubuntu gnome shell theme"  
  depends=("gnome-shell")
  
  DESTDIR="$pkgdir" meson install -C build
  rm -r "$pkgdir/usr/share/glib-2.0"
  rm -r "$pkgdir/usr/share/xsessions"
  rm -r "$pkgdir/usr/share/wayland-sessions"
  rm -r "$pkgdir/usr/share/icons"
  rm -r "$pkgdir/usr/share/sounds"
  rm -r "$pkgdir/usr/share/themes"
}

package_yaru-icon-theme() {
  pkgdesc="Yaru default ubuntu icon theme"  
  depends=(hicolor-icon-theme gtk-update-icon-cache librsvg)

  DESTDIR="$pkgdir" meson install -C build
  rm -r "$pkgdir/usr/share/glib-2.0"
  rm -r "$pkgdir/usr/share/gnome-shell"
  rm -r "$pkgdir/usr/share/xsessions"
  rm -r "$pkgdir/usr/share/wayland-sessions"
  rm -r "$pkgdir/usr/share/sounds"
  rm -r "$pkgdir/usr/share/themes"
}

# vim: ts=2 sw=2 et:
