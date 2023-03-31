# Maintainer: Benoit Brummer < trougnouf at gmail dot com >
# Contributor: Carl George < arch at cgtx dot us >

pkgname=gnome-shell-extension-dash-to-panel
_name=dash-to-panel
pkgver=56
pkgrel=2
pkgdesc='Extension for GNOME shell to combine the dash and main panel'
arch=(any)
url="https://github.com/home-sweet-gnome/dash-to-panel"
license=(GPL2)
makedepends=(git gnome-common intltool make)
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('b04c01f7bbb0e140febd569574905dba880dba011968725a9a96a5bf23560ffe')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    sed -Ei "s/^\"version\": [0-9]+$/\"version\": ${pkgver}/" metadata.json
    make VERSION="$pkgver" _build
}

package() {
    depends=('gnome-shell')
    cd "${srcdir}/${_name}-${pkgver}"
    make DESTDIR="$pkgdir" install
}
