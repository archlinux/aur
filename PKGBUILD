# Maintainer: Lex Black <autumn-wind@web.de>

pkgname=gtk-theme-plano
_pkgname=plano-theme
_pkgauthor=lassekongo83
pkgver=3.36.1
pkgrel=1
pkgdesc='flat GTK+ theme'
arch=('any')
url="https://github.com/${_pkgauthor}/${_pkgname}"
license=('GPL3')
depends=('gtk-engines')
makedepends=('meson' 'ninja' 'sassc')
optdepends=('ttf-roboto: for the GNOME shell theme'
            'gtk-engine-murrine: for the GTK2 theme')
conflicts=('gtk-theme-plano-git')
source=(${_pkgname}-${pkgver}.tar.gz::https://github.com/lassekongo83/${_pkgname}/archive/v${pkgver/%.1/-1}.tar.gz)
sha256sums=('ccf659111218cd0f2d3c59eee635ce70fddfff56eb09f9177452e34512e44c7a')


build() {
    cd "${_pkgname}-${pkgver/%.1/-1}"
    meson build --prefix=/usr
    cd build
    ninja
}

package() {
    cd "${_pkgname}-${pkgver/%.1/-1}/build"
    DESTDIR="${pkgdir}" ninja install
}
