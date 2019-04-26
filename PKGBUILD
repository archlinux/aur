# Maintainer: Térence Clastres <t.clastres@gmail.com>

pkgname=gnome-shell-extension-notification-center-git 
pkgver=r130.eb12dca
pkgrel=2
pkgdesc="A GNOME Shell extension that eables notification center indicator on top panel and customizations."
arch=('any')
url="https://github.com/Selenium-H/Notification-Center"
license=('GPL3')
depends=('gnome-shell>=3.22' 'dconf')
makedepends=('git')
provides=("${pkgname/-git}")
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$pkgname"

    mkdir -p "$pkgdir/usr/share/gnome-shell/extensions/"
    glib-compile-schemas notification-center@Selenium-H/schemas/
    # install  -Dm644 notification-center@Selenium-H/schemas/*.xml -t "$pkgdir/usr/share/glib-2.0/schemas/" not supported by the extension
    cp -R "notification-center@Selenium-H" "$pkgdir/usr/share/gnome-shell/extensions/"
}


