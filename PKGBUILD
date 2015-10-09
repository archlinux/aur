# Maintainer: Carl George < arch at cgtx dot us >
# Contributor: Janne Haapsaari < haaja at iki dot fi >
# Contributor: Christopher Krooß < didi2002 at web dot de >

_extname="dash-to-dock"
_author="micheleg"

pkgname="gnome-shell-extension-${_extname}"
pkgver=49
pkgrel=1
epoch=1
pkgdesc="This extension moves the dash out of the overview transforming it in a dock for an easier launching of applications and a faster switching between windows and desktops."
arch=("any")
url="https://${_author}.github.io/${_extname}/"
license=("GPL2")
depends=("dconf")
makedepends=("gnome-common" "intltool")
conflicts=("gnome-shell-extensions-dash-to-dock-git")
install="gschemas.install"
source=("https://github.com/${_author}/${_extname}/archive/extensions.gnome.org-v${pkgver}.tar.gz")
noextract=()
sha256sums=('50bd242f3f6e6089137957c175462475d10a2e39f6014184b792248ed7708084')

build() {
    cd "${srcdir}/${_extname}-extensions.gnome.org-v${pkgver}"
    make
}

package() {
    cd "${srcdir}/${_extname}-extensions.gnome.org-v${pkgver}"
    make \
        INSTALLBASE="${pkgdir}/usr/share/gnome-shell/extensions" \
        VERSION="${pkgver}" \
        install
    _gschema="schemas/org.gnome.shell.extensions.dash-to-dock.gschema.xml"
    install -Dm0644 "${_gschema}" "${pkgdir}/usr/share/glib-2.0/${_gschema}"
}
