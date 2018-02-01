# Maintainer: Joaquin Garmendia <joaquingc123 at gmail dot com>
# Contributor: Orestis Floros <orestisf1993@gmail.com>

# All my PKGBUILDs can be found in https://www.github.com/joaquingx/PKGBUILDs

pkgname=gtk-arc-flatabulous-theme-git
_pkgname=arc-flatabulous-theme
pkgver=20180201.r0.g0492475
pkgrel=1
pkgdesc="Arc theme with Flatabulous window controls."
arch=('any')
url="https://github.com/andreisergiu98/${_pkgname}"
license=('GPL3')
makedepends=('git' 'gtk3' 'sassc')
optdepends=('gtk-engine-murrine: for gtk2 themes'
            'gnome-themes-standard: for gtk2 themes'
	    'arc-icon-theme: recommended icon theme'
	    'gtk3: for gtk3 themes'
	    )
source=("git+${url}")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
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
