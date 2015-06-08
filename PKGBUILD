# Maintainer: pzl <alsoelp@gmail.com>

_pkgname=phallus-fonts
pkgname=${_pkgname}-git
pkgver=r141.3e8bf64
pkgrel=1
pkgdesc="Lemon and Uushi fonts by phallus"
arch=('any')
url="https://github.com/phallus/fonts"
license=('custom:WTFPL')
depends=('xorg-font-util')
makedepends=('git' 'fontconfig')
install="${_pkgname}.install"
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=()
source=("${_pkgname}::git+https://github.com/phallus/fonts")
md5sums=('SKIP')
sha256sums=('SKIP')


build() {
    cd "$srcdir/${_pkgname}"
    bdftopcf -o lemon.pcf lemon.bdf
    bdftopcf -o uushi.pcf uushi.bdf
}

pkgver() {
    cd "$srcdir/${_pkgname}"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )

}

package() {
    cd "$srcdir/${_pkgname}"
    install -D -m644 lemon.pcf "${pkgdir}/usr/share/fonts/misc/lemon.pcf"
    install -D -m644 uushi.pcf "${pkgdir}/usr/share/fonts/misc/uushi.pcf"
    install -D -m644 license "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
