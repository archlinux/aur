# Maintainer: drakkan <nicola.murino at gmail dot com>
pkgbase=yaru
pkgname=('yaru-sound-theme' 'yaru-gtk-theme' 'yaru-gnome-shell-theme' 'yaru-icon-theme')
pkgver=18.10
pkgrel=1
pkgdesc="Yaru default ubuntu theme"
arch=(any)
url="https://github.com/ubuntu/yaru"
license=('GPL3')

makedepends=('meson' 'sassc' 'git')
options=('!strip' '!buildflags' 'staticlibs')
conflicts=('yaru-git')
_commit=684f3d3f9cf9f7fd793f80e2fcf38dde7f970a43  # 18.10

source=("git+https://github.com/ubuntu/${pkgbase}#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgbase}
  git describe --tags | sed 's/-/+/g'
}

build() {
  arch-meson ${pkgbase} build
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
