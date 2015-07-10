# Maintainer: Carl George < arch at cgtx dot us >
# Contributor: Janne Haapsaari < haaja at iki dot fi >
# Contributor: Christopher Krooß < didi2002 at web dot de >

_extname="dash-to-dock"
_author="micheleg"

pkgname="gnome-shell-extension-${_extname}"
pkgver=46
pkgrel=1
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
md5sums=("f085cee5b4373029a00d7987081d1d5d")

build() {
    cd "${srcdir}/${_extname}-extensions.gnome.org-v${pkgver}"
    make
}

package() {
    cd "${srcdir}/${_extname}-extensions.gnome.org-v${pkgver}"
    make INSTALLBASE="${pkgdir}/usr/share/gnome-shell/extensions" install
    _gschema="schemas/org.gnome.shell.extensions.dash-to-dock.gschema.xml"
    install -Dm0644 "${_gschema}" "${pkgdir}/usr/share/glib-2.0/${_gschema}"
}
