# Maintainer: Radeox <dawid.weglarz95@gmail.com>

pkgname=gnome-shell-extension-forge
_pkgname=forge
_gnomever=43
pkgver=61
pkgrel=2
pkgdesc="Tiling and Window Manager for Gnome-Shell"
arch=('any')
url="https://github.com/jmmaranan/forge"
license=('GPLv3')
depends=('gnome-shell')
makedepends=('intltool' 'gettext' 'git' 'sassc')
source=("https://github.com/jmmaranan/${_pkgname}/archive/refs/tags/v${_gnomever}-${pkgver}.tar.gz")
sha256sums=("8bc0a421af073aade93eb7e32503210fee2666923661c19cd34306e7a6c51c73")

build() {
    cd ${srcdir}/${_pkgname}-${_gnomever}-${pkgver}/
    make build
}

package() {
    cd ${srcdir}/${_pkgname}-${_gnomever}-${pkgver}/
    local uuid=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)
    local destdir="$pkgdir/usr/share/gnome-shell/extensions/$uuid"

    install -d "$destdir"
    cp -rT temp "$destdir"

    cp -r temp/locale "$pkgdir/usr/share/"
    rm -rf "$destdir/locale"

    install -Dm644 "temp/schemas/org.gnome.shell.extensions.forge.gschema.xml" -t "$pkgdir/usr/share/glib-2.0/schemas/"
    rm -rf "$destdir/schemas"
}
