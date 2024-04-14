# Maintainer: nosduco <nosduco at gmail dot com>

pkgname=gnome-shell-extension-hue-lights
_pkgname=hue-lights
pkgver=35
pkgrel=2
epoch=1
pkgdesc="Gnome Shell extension for Philips Hue compatible lights controlled by the Philips Hue Bridge and for controlling Philips Hue HDMI sync box. "
arch=('any')
url="https://github.com/vchlum/hue-lights"
license=('MIT')
depends=('gnome-shell')
makedepends=('intltool' 'gettext' 'git')
_commit=634469f334995de7745f153998cb7cc6b6ee9e8e
source=("git+https://github.com/vchlum/hue-lights.git#commit=$_commit")
sha512sums=('SKIP')

build() {
        cd "${srcdir}"/${_pkgname}
        bash release.sh
}

package() {
        cd "${srcdir}"/${_pkgname}
        _extensiondir="/usr/share/gnome-shell/extensions/hue-lights@chlumskyvaclav.gmail.com"
        install -d "$pkgdir$_extensiondir"
        bsdtar -x -f hue-lights@chlumskyvaclav.gmail.com.zip -C "$pkgdir$_extensiondir"
        install -Dm644 schemas/org.gnome.shell.extensions.hue-lights.gschema.xml -t "$pkgdir/usr/share/glib-2.0/schemas"
}
