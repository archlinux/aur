# Maintainer: David Manouchehri <manouchehri@riseup.net>
# Contributor: Andrey Pavlenko <andrey.pavlenko@mail.ru>

_gitname=rk-tools
pkgname="${_gitname}-git"
_gitbranch=master
_gitauthor=rk3066
pkgver=r14.a54f31b
pkgrel=1
pkgdesc="RockChip tools for RK29xx and RK30xx generations, mainly to modify ROMs."
url="https://github.com/${_gitauthor}/${_gitname}"
license=('')
source=("git://github.com/${_gitauthor}/${_gitname}#branch=${_gitbranch}")
sha512sums=('SKIP')
arch=('armv6h' 'armv7h' 'i686' 'x86_64') # arch=('any')
depends=('')
makedepends=('git')
conflicts=("${_gitname}")
provides=("${_gitname}")

pkgver() {
  cd "${srcdir}/${_gitname}"
  (
    set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "${srcdir}/${_gitname}"
  make
}

package() {
  cd "${srcdir}/${_gitname}"
  mkdir -p "${pkgdir}/usr/bin/"
  install -Dm755 "${srcdir}/${_gitname}/afptool" "${pkgdir}/usr/bin/"
  install -Dm755 "${srcdir}/${_gitname}/img_maker" "${pkgdir}/usr/bin/"
  install -Dm755 "${srcdir}/${_gitname}/img_unpack" "${pkgdir}/usr/bin/"
  install -Dm755 "${srcdir}/${_gitname}/rkcrc" "${pkgdir}/usr/bin/"
  install -Dm755 "${srcdir}/${_gitname}/rkkernel" "${pkgdir}/usr/bin/"
}

# vim:set et sw=2 sts=2 tw=80: