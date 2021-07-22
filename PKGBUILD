# Maintainer: Lex Black <autumn-wind@web.de>

pkgname=gtk-theme-plano
_pkgname=plano-theme
_pkgauthor=lassekongo83
pkgver=3.38.1
pkgrel=2
pkgdesc='flat GTK+ theme'
arch=('any')
url="https://github.com/${_pkgauthor}/${_pkgname}"
license=('GPL3')
makedepends=('meson' 'ninja' 'sassc')
optdepends=('ttf-roboto: for the GNOME shell theme'
            'gtk-engines: for the GTK2 theme'
            'gtk-engine-murrine: for the GTK2 theme')
conflicts=('gtk-theme-plano-git')
source=(${_pkgname}-${pkgver}.tar.gz::https://github.com/lassekongo83/${_pkgname}/archive/v${pkgver/%.1/-1}.tar.gz)
sha256sums=('0f315c8beb53723ea0f669f004ade986ef8ac20c6d25d988b7aa2c6caa98eba4')


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
