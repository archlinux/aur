# Maintainer: Philip Goto <philip.goto@gmail.com>
# Contributor: drakkan <nicola.murino at gmail dot com>

pkgbase=yaru-git
pkgname=(yaru-sound-theme-git
         yaru-gtk-theme-git
         yaru-gnome-shell-theme-git
         yaru-icon-theme-git)
pkgver=18.10.6.r7.g8b3f63d6
pkgrel=1
pkgdesc="Yaru default ubuntu theme"
arch=(any)
url="https://github.com/ubuntu/yaru"
license=('GPL3')
makedepends=('meson' 'sassc' 'git')
options=('!strip' '!buildflags' 'staticlibs')
source=("git+https://github.com/ubuntu/yaru"
        "0001-gnome-shell-fix-install-dir.patch")
sha256sums=('SKIP'
            'c84e9720c47fc86eaf89ebc647bb656b13a3e79aa0b01c46734c5db013e42bc5')

pkgver() {
    cd yaru
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd yaru
    patch -Np1 < ../0001-gnome-shell-fix-install-dir.patch
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
}

package_yaru-gtk-theme-git() {
    pkgdesc="Yaru default ubuntu gtk theme"  
    depends=("gtk3" "gdk-pixbuf2" "gtk-engine-murrine" "gnome-themes-extra")
    provides=(yaru-gtk-theme)
    conflicts=(yaru-gtk-theme)

    DESTDIR="$pkgdir" ninja -C build install
    rm -r "$pkgdir/usr/share/glib-2.0"
    rm -r "$pkgdir/usr/share/xsessions"
    rm -r "$pkgdir/usr/share/wayland-sessions"
    rm -r "$pkgdir/usr/share/themes/Yaru/gnome-shell"
    rm -r "$pkgdir/usr/share/icons"
    rm -r "$pkgdir/usr/share/sounds"
}

package_yaru-gnome-shell-theme-git() {
    pkgdesc="Yaru default ubuntu gnome shell theme"  
    depends=("gnome-shell")
    provides=(yaru-gnome-shell-theme)
    conflicts=(yaru-gnome-shell-theme)

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
}
