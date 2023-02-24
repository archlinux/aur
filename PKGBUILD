_name="material-shell"
pkgname="gnome-shell-extension-${_name}"
pkgver="43b"
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
b2sums=("c5968f0696737be31a2026814eef31e43b197e4e8e9d9eedc2fee92097b312dcb9455962b81408e007d7dcc8fba0a54747f9adabba87ba296ab46ed26a4ece68")

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
