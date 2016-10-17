# Maintainer: Phillip Schichtel <phillip.public@schich.tel>
pkgname=adapta-backgrounds
pkgver="0.1.0.1"
pkgrel=1
pkgdesc="Wallpaper collection for adapta-project"
arch=(any)
url="https://github.com/adapta-project/${pkgname}"
license=('GPL2' 'CCPL')
makedepends=('glib2>=2.48.0'
             'libxml2')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('fc657c6023044470c7df3eb8f52f7743e03f166bf36442a0b2c0eb39e3eee585')

_prefix="/usr"

build() {
    cd "${pkgname}-${pkgver}"
    ./autogen.sh --prefix "${pkgdir}${_prefix}"
    make
}

package() {
    cd "${pkgname}-${pkgver}"
    make install -j 8
    sed -i s:"${pkgdir}${_prefix}":"${_prefix}":g "${pkgdir}${_prefix}/share/gnome-background-properties/${pkgname}.xml"
}

