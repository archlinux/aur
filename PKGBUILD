# Maintainer: FadeMind <fademind@gmail.com>
# Contributor: Tianjiao Yin <ytj000+aur@gmail.com>

_plugin_name=saved_password_editor
pkgname=firefox-extension-saved-password-editor
pkgver=2.9.6
pkgrel=2
pkgdesc="Adds the ability to create and edit entries in the password manager."
url="https://addons.mozilla.org/firefox/addon/saved-password-editor/"
depends=("firefox")
makedepends=('unzip')
license=('GPLv3')
arch=('any')
source=("${_plugin_name}-${pkgver}.xpi::https://addons.cdn.mozilla.net/user-media/addons/60265/${_plugin_name}-${pkgver}-sm+tb+fx.xpi")
sha256sums=('8490edd12a76e838302d6fc1ff3e542ce18a17fc6ed7a08dcf39a9b55ca91409')
noextract=("${_plugin_name}-${pkgver}.xpi")

prepare(){
    unzip -qqo ${_plugin_name}-${pkgver}.xpi
}

package() {
    cd "$srcdir"
    emid=$(grep -Pom1 'id>\K[^<]*' install.rdf)
    local dstdir="$pkgdir/usr/lib/firefox/browser/extensions/${emid}"
    install -d "$dstdir"
    rm *.xpi
    cp -dpr --no-preserve=ownership * "$dstdir"
    chmod -R 755 "$dstdir"
}
