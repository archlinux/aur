# Maintainer: Lex Black <autumn-wind@web.de>

pkgname=gtk-theme-plano
_pkgname=plano-theme
_pkgauthor=lassekongo83
pkgver=3.36.2
pkgrel=2
pkgdesc='flat GTK+ theme'
arch=('any')
url="https://github.com/${_pkgauthor}/${_pkgname}"
license=('GPL3')
depends=('gtk-engines')
makedepends=('meson' 'ninja' 'sassc')
optdepends=('ttf-roboto: for the GNOME shell theme'
            'gtk-engine-murrine: for the GTK2 theme')
conflicts=('gtk-theme-plano-git')
source=(${_pkgname}-${pkgver}.tar.gz::https://github.com/lassekongo83/${_pkgname}/archive/v${pkgver/%.2/-2}.tar.gz)
sha256sums=('16653048f733c1067020bc337f54b2dccb31b7aab823aac3b473d0f29ac2ffe5')


build() {
    cd "${_pkgname}-${pkgver/%.2/-2}"
    meson build --prefix=/usr
    cd build
    ninja
}

package() {
    cd "${_pkgname}-${pkgver/%.2/-2}/build"
    DESTDIR="${pkgdir}" ninja install
}
