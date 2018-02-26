# Maintainer: Noeljnuior <liamgliamgmailcom>

# Contributor: NicoHood <archlinux {cat} nicohood {dog} de>
# Contributor: zach <zach {at} zach-adams {dot} com>
# Contributor: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de
# Contributor: Philipp Wolfer <ph.wolfer@gmail.com>

_pkgname=arc-theme
pkgname=arc-gtk-theme-git
pkgdesc="A flat theme with transparent elements for GTK 3, GTK 2 and Gnome-Shell"
pkgver=712.51d88f1
pkgrel=1
arch=('any')
# Upstream url: https://github.com/horst3180/arc-theme
# Now using soft fork: https://github.com/horst3180/arc-theme/issues/840
url="https://github.com/nicohood/arc-theme"
license=('GPL3')
optdepends=('arc-icon-theme: recommended icon theme'
            'gtk-engine-murrine: for gtk2 themes'
            'gnome-themes-standard: for gtk2 themes')
makedepends=('git' 'gtk3' 'sassc')
source=(${_pkgname}::"git+https://github.com/nicohood/${_pkgname}.git")
sha512sums=('SKIP')
conflicts=('arc-gtk-theme')
provides=('arc-gtk-theme')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
    cd ${_pkgname}
    ./autogen.sh --prefix=/usr

    cd ../${_pkgname}
    ./autogen.sh --prefix=/usr
}

package() {
    cd ${_pkgname}
    make DESTDIR="${pkgdir}" install
}
