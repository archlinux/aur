_name="material-shell"
pkgname="gnome-shell-extension-${_name}"
pkgver="44"
pkgrel="1"
pkgdesc='A modern desktop interface for Linux extending GNOME Shell.'
arch=('any')
url="https://github.com/${_name}/${_name}"
license=('GPL3')
conflicts=("${pkgname}-git")
depends=('gnome-shell')
makedepends=("npm")
optdepends=('plata-theme: GTK and shell theme'
            'tela-icon-theme: icon theme'
            'ttf-roboto: font')
groups=('gnome-shell-extensions')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
b2sums=("9fa945a71f20c7b7e1012fb738e10bfaccd908cb9de2248cb3a00158ff312723ea01f5b6b9188776a0687ef8e7934b9a56e3ca72c5fa3effa5dda7f1f65e5f9c")

_dir="material-shell-${pkgver}"
_uuid="material-shell@papyelgringo"

build() {
    cd "${srcdir}/${_dir}"
    npm install --cache "${srcdir}/npm-cache"
    make compile
}

package() {
    cd "${srcdir}/${_dir}"
    install -d "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}/"
    cp -r dist/* "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}/"
}
