# Maintainer: Emil Renner Berthing <esmil@mailme.dk>
# Contributor: Elis Axelsson <etu@failar.nu>

_pkgname=stupidterm
pkgname=${_pkgname}-git
pkgver=v1.r9.g61bf67b
pkgrel=1
pkgdesc="A Stupid Terminal based on VTE"
arch=("i686" "x86_64" "armv5tel" "armv7l")
url="https://github.com/esmil/stupidterm"
license=("LGPL")
depends=("vte3")
conflicts=("stupidterm" "st")
source=(
    "${_pkgname}::git+https://github.com/esmil/stupidterm.git"
    'st.desktop'
)
md5sums=(
    'SKIP'
    '23b1a68491fef30c9bcbb9459ec67a23'
)
provides=(
    'stupidterm'
)

pkgver() {
    cd "${_pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${_pkgname}"

    make clean
    make release
}

package() {
    cd "${_pkgname}"

    make DESTDIR="${pkgdir}" prefix=/usr install

    # Create path for .dsktop file
    mkdir -p $pkgdir/usr/share/applications/

    # Copy .desktop file to package
    cat $srcdir/st.desktop > $pkgdir/usr/share/applications/st.desktop
}
