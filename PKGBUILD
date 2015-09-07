# Maintainer: Bertrand Bonnefoy-Claudet <bertrandbc@gmail.com>
# Contributor: Timothy Lee <timothy.ty.lee@gmail.com>

pkgname=connman-ui-git
pkgver=r38.fce0af9
pkgrel=1
pkgdesc="A full-featured GTK based trayicon UI for ConnMan (git version)"
arch=('i686' 'x86_64')
url="https://github.com/tbursztyka/connman-ui"
license=('GPL2')
depends=('connman' 'gtk3')
makedepends=('git' 'intltool')
source=('git+https://github.com/tbursztyka/connman-ui.git'
        'connman-ui-autostart.desktop')
sha256sums=('SKIP'
            'b249cd6d59cb8814ff1d9445efe1bdbc99d164daebe0f693dda938874736a3f8')

_gitroot="connman-ui"

pkgver() {
    cd "$srcdir/$_gitroot"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$_gitroot"
    ./autogen.sh
    ./configure --prefix=/usr
    make
}

package() {
    cd "$srcdir/$_gitroot"
    make PREFIX=/usr DESTDIR="$pkgdir" install
    install -D -m 644 "$startdir/connman-ui-autostart.desktop" \
        "$pkgdir/etc/xdg/autostart/connman-ui-autostart.desktop"
    install -D -m 644 "$pkgdir/usr/share/connman_ui_gtk/icons/gsm-3g-full.png" \
        "$pkgdir/usr/share/icons/hicolor/64x64/apps/connman-ui.png"
}
