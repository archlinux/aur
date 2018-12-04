# Maintainer: Caleb Bassi <calebjbassi@gmail.com>

pkgname=imgurbash2-git
_pkgname=${pkgname%-git}
pkgver=r57.7669636
pkgrel=1
pkgdesc="A shell script that uploads/deletes images to/from IMGUR"
arch=("any")
url="https://github.com/ram-on/imgurbash2"
license=("MIT")
depends=('curl')
optdepends=('xsel: automatically putting the URL on the X selection for easy pasting'
            'xclip: an alternative to xsel')
makedepends=("git")
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("git+${url}")
md5sums=("SKIP")

pkgver() {
  cd "${_pkgname}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
    mkdir -p "${pkgdir}/usr/bin"
    mv ${srcdir}/${_pkgname}/${_pkgname} ${pkgdir}/usr/bin
}
