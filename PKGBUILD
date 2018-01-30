# Maintainer: Joaquin Garmendia <joaquingc123 at gmail dot com>
# Contributor: Orestis Floros <orestisf1993@gmail.com>

# All my PKGBUILDs can be found in https://www.github.com/joaquingx/PKGBUILDs

pkgname=gtk-arc-flatabulous-theme-git
_pkgname=arc-flatabulous-theme
pkgver=r709.1b1b7c9
pkgrel=1
pkgdesc="Arc theme with Flatabulous window controls."
arch=('any')
url="https://github.com/andreisergiu98/${_pkgname}"
license=('GPL3')
makedepends=('git' 'gtk3')
optdepends=('gtk-engine-murrine: for gtk2 themes'
            'gnome-themes-standard: for gtk2 themes'
	    'arc-icon-theme: recommended icon theme'
	    'gtk3: for gtk3 themes'
	    )
source=("git+${url}")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${srcdir}/${_pkgname}"
    autoreconf -fi 
}

build() {
    cd "${srcdir}/${_pkgname}"
    ./configure --prefix=/usr
}

package() {
    cd "${srcdir}/${_pkgname}"
    make DESTDIR="${pkgdir}" install
}
