# Maintainer: ValHue <vhuelamo at gmail dot com>
#
# Contributor: ValHue <vhuelamo at gmail dot com>
#
_pkgname="cover-thumbnailer"
pkgname="${_pkgname}-git"
pkgver=r82.c82d816
pkgrel=1
pkgdesc="A Python script which generates folder thumbnails for various file browser on Linux. It displays music album covers, preview of pictures which are in a folder and more."
arch=('i686' 'x86_64')
url="https://github.com/flozz/cover-thumbnailer"
license=('GPL3')
depends=('python-pillow')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("${_pkgname}::git+${url}")
sha256sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    ( set -o pipefail
      git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

package() {
    cd "${_pkgname}"
    ./install.sh -p ${pkgdir}

    install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

# vim: set ts=4 sw=4 et syn=sh ft=sh:
