# Maintainer : Yamada Hayao <hayao@fascode.net>
# Contributer: David Birks <david@birks.dev>

_name="material-shell"
pkgname="gnome-shell-extension-${_name}"
pkgver="42"
pkgrel="1"
pkgdesc='Tiling window extension for GNOME, following Material Design guidelines'
arch=('x86_64')
url="https://github.com/${_name}/${_name}"
license=('MIT')
conflicts=("${pkgname}-git")
depends=('gnome-shell>=3.34')
makedepends=("npm")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=("SKIP")

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
    cp -r "dist/"* "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}/"
}
