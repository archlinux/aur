# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="bin2header"
pkgname="${_pkgname}-git"
pkgver=r4.f5a8cef
pkgrel=1
pkgdesc="A small tool to convert binary files into C-header files to include into your code"
arch=('x86_64')
url="https://github.com/spacerace/${_pkgname}"
license=('custom:None')
depends=('glibc')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}"
source=("${_pkgsrc}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgsrc}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  gcc ${CFLAGS} ${LDFLAGS} "${_pkgname}.c" -o "${_pkgname}"
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
