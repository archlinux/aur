# Maintainer: Étienne Deparis <etienne@depar.is>
pkgname=chwall
pkgver=0.7.2
pkgrel=1
pkgdesc="A tiny wallpaper changer, written in python"
arch=("any")
url="https://git.umaneti.net/chwall/about/"
license=("LicenseRef-WTFPL")
depends=("gdk-pixbuf2" "gobject-introspection-runtime" "gtk3"
         "hicolor-icon-theme" "procps-ng" "python" "python-cssselect"
         "python-gobject" "python-importlib-metadata" "python-lxml"
         "python-pillow" "python-pyxdg" "python-requests" "python-yaml")
makedepends=("imagemagick" "python-build" "python-installer"
             "python-setuptools" "python-wheel")
optdepends=("feh: to apply wallpaper on independant desktop manager"
            "imagemagick: to extract wallpaper size when using feh"
            "libappindicator-gtk3: to display a tray icon"
            "libnotify: to send notification when wallpaper change"
            "xorg-xrandr: to extract screen config when using feh")
source=("https://git.umaneti.net/${pkgname}/snapshot/${pkgname}-${pkgver}.tar.gz")
sha256sums=('0765c1b8fe7f0cadbf130d571215739546f799d7702dc5fb01320a31d8762f8c')
options=(!debug)

check() {
    cd "$pkgname-$pkgver"
    make test
}

package() {
    cd "$pkgname-$pkgver"
    make package DESTDIR="$pkgdir" CHWALL_NATIVE_PATH=yes
}
