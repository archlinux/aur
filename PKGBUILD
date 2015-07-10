# Maintainer: Janne Haapsaari <haaja@iki.fi>
# Contributor: Christopher Krooß <didi2002 at web.de>
pkgname=gnome-shell-extension-dash-to-dock
pkgver=v46
pkgrel=2
pkgdesc="A gnome-shell extension that transforms the dash into an intellihide dock"
arch=('any')
url="https://github.com/micheleg/dash-to-dock"
license=('GPL')
depends=('dconf')
makedepends=('gnome-common' 'intltool')
provides=('gnome-shell-extension-dash-to-dock')
conflicts=('gnome-shell-extensions-dash-to-dock-git')
source=("$pkgname::https://github.com/micheleg/dash-to-dock/archive/extensions.gnome.org-${pkgver}.tar.gz")
md5sums=('f085cee5b4373029a00d7987081d1d5d')
install='gschemas.install'

_archivename="dash-to-dock-extensions.gnome.org-${pkgver}"

prepare() {
    cd "$srcdir/$_archivename"
    sed -i 's/INSTALLBASE = ~\/.local\/share\/gnome-shell\/extensions/INSTALLBASE = ${DESTDIR}/'\
        Makefile
}

build() {
    cd "$srcdir/$_archivename"
    make
}

package() {
    cd "$srcdir/$_archivename"
    mkdir -p "${pkgdir}/usr/share/gnome-shell/extensions" "${pkgdir}/usr/share/glib-2.0/schemas/"
    make DESTDIR=${pkgdir}/usr/share/gnome-shell/extensions install
    install -m644 "schemas/org.gnome.shell.extensions.dash-to-dock.gschema.xml" \
        "${pkgdir}/usr/share/glib-2.0/schemas/org.gnome.shell.extensions.dash-to-dock.gschema.xml"
}
