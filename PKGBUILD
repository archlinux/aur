# Maintainer: Philip Goto <philip.goto@gmail.com>
# Contributor: drakkan <nicola.murino at gmail dot com>

pkgbase=yaru-git
pkgname=(yaru-sound-theme-git
         yaru-gtk-theme-git
         yaru-gnome-shell-theme-git
         yaru-icon-theme-git
         yaru-session-git)
pkgver=18.10.7.r288.g93c13b3e
pkgrel=1
pkgdesc="Yaru default ubuntu theme"
arch=(any)
url="https://github.com/ubuntu/yaru"
license=('GPL3')
makedepends=(meson sassc git)
options=('!strip' '!buildflags' 'staticlibs')
source=("git+https://github.com/ubuntu/yaru")
sha256sums=('SKIP')


pkgver() {
    cd yaru
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    arch-meson yaru build
    ninja -C build
}

package_yaru-sound-theme-git() {
    pkgdesc="Yaru default ubuntu sound theme"
    provides=(yaru-sound-theme)
    conflicts=(yaru-sound-theme)

    DESTDIR="$pkgdir" ninja -C build install
    rm -r "$pkgdir/usr/share/glib-2.0"
    rm -r "$pkgdir/usr/share/xsessions"
    rm -r "$pkgdir/usr/share/wayland-sessions"
    rm -r "$pkgdir/usr/share/icons"
    rm -r "$pkgdir/usr/share/themes"
    rm -r "$pkgdir/usr/share/gnome-shell"
}

package_yaru-gtk-theme-git() {
    pkgdesc="Yaru default ubuntu gtk theme"  
    depends=(gtk3 gdk-pixbuf2 gtk-engine-murrine gnome-themes-extra)
    provides=(yaru-gtk-theme)
    conflicts=(yaru-gtk-theme)
    
    DESTDIR="$pkgdir" ninja -C build install
    rm -r "$pkgdir/usr/share/glib-2.0"
    rm -r "$pkgdir/usr/share/xsessions"
    rm -r "$pkgdir/usr/share/wayland-sessions"
    rm -r "$pkgdir/usr/share/icons"
    rm -r "$pkgdir/usr/share/sounds"
    rm -r "$pkgdir/usr/share/gnome-shell"
}

package_yaru-gnome-shell-theme-git() {
    pkgdesc="Yaru default ubuntu gnome shell theme"  
    depends=(gnome-shell yaru-session)
    provides=(yaru-gnome-shell-theme)
    conflicts=(yaru-gnome-shell-theme)
    
    DESTDIR="$pkgdir" ninja -C build install
    rm -r "$pkgdir/usr/share/glib-2.0"
    rm -r "$pkgdir/usr/share/xsessions"
    rm -r "$pkgdir/usr/share/wayland-sessions"
    rm -r "$pkgdir/usr/share/icons"
    rm -r "$pkgdir/usr/share/sounds"
    rm -r "$pkgdir/usr/share/themes"
}

package_yaru-icon-theme-git() {
    pkgdesc="Yaru default ubuntu icon theme"  
    depends=(hicolor-icon-theme gtk-update-icon-cache librsvg)
    provides=(yaru-icon-theme)
    conflicts=(yaru-icon-theme)

    DESTDIR="$pkgdir" ninja -C build install
    rm -r "$pkgdir/usr/share/glib-2.0"
    rm -r "$pkgdir/usr/share/xsessions"
    rm -r "$pkgdir/usr/share/wayland-sessions"
    rm -r "$pkgdir/usr/share/sounds"
    rm -r "$pkgdir/usr/share/themes"
    rm -r "$pkgdir/usr/share/gnome-shell"
}

package_yaru-session-git() {
    pkgdesc="Yaru session"
    depends=(gnome-shell)
    provides=(yaru-session)
    conflicts=(yaru-session)

    DESTDIR="$pkgdir" ninja -C build install
    rm -r "$pkgdir/usr/share/sounds"
    rm -r "$pkgdir/usr/share/themes"
    rm -r "$pkgdir/usr/share/gnome-shell"
    rm -r "$pkgdir/usr/share/icons"
}
