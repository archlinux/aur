# Maintainer: acxz <akashpatel2008 at yahoo dot com>
# Maintainer: Joaquin Garmendia <joaquingc123 at gmail dot com>
# Contributor: Orestis Floros <orestisf1993@gmail.com>
pkgname=gtk-arc-flatabulous-theme
_pkgname=arc-flatabulous-theme
pkgver=20180201
pkgrel=3
pkgdesc="Arc theme with Flatabulous window controls."
arch=('any')
url="https://github.com/andreisergiu98/${_pkgname}"
license=('GPL3')
makedepends=('autoconf' 'automake' 'sassc' 'optipng' 'inkscape')
optdepends=('gtk-engine-murrine: for gtk2 themes'
            'gnome-themes-extra: for gtk2 themes'
            'gtk3: for gtk3 themes'
            'gnome-shell: for detecting GNOME Shell version'
           )
source=("https://github.com/andreisergiu98/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('37c4a748273ed32cc5ec16fa083dfc4f708374b1a9811b03baf311265f6b5f4d')
conflicts=('gtk-arc-flatabulous-theme')

_autogen_options=()

check_optdepends() {
    # Check if gnome-shell is installed
    if (pacman -Qq gnome-shell > /dev/null) ; then
        msg "Enabling GNOME Shell support"
    else
        msg "Disabling GNOME Shell support"
        _autogen_options=(${_autogen_options[@]} --disable-gnome-shell)
    fi
}

build() {

    # Check optional dependencies
    check_optdepends

    cd "${srcdir}/${_pkgname}-${pkgver}"
    ./autogen.sh ${_autogen_options[@]} --prefix=/usr
    make
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
