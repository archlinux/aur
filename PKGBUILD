# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="ptext"
pkgname="${_pkgname}-git"
pkgver=r166.3d7c1db
pkgrel=1
pkgdesc="A nano like text editor built with pure C"
arch=('any')
url="https://github.com/proh14/${_pkgname}"
license=('BSD-2-Clause')
makedepends=('git')
depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}"
source=("${_pkgsrc}::git+${url}.git"
        "${_pkgname}_fix_makefile_flags.patch")
sha256sums=('SKIP'
            'c021a13741f497940464671fea15e879c153900a354e5f853e34557301ab2c92')

pkgver() {
  cd "${_pkgsrc}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  patch -p1 -i "${srcdir}/${_pkgname}_fix_makefile_flags.patch"
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  make
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -Dm755 "build/${_pkgname}"  "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm755 "docs/${_pkgname}.1" "${pkgdir}/usr/share/man/man1/${_pkgname}.1"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
