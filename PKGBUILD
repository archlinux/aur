# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="holy-fetch"
pkgname="${_pkgname}-git"
pkgver=r13.2f32b2a
pkgrel=1
pkgdesc="A fetch program written in HolyC"
arch=('x86_64')
url="https://github.com/Tuhkis/${_pkgname}"
license=('custom:None')
makedepends=('git' 'hc2c')
depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}"
source=("${_pkgsrc}::git+${url}.git"
        "${_pkgname}_fix_build_flags.patch")
sha256sums=('SKIP'
            '7953c47ada821e7bbc1679f55f5f98be23d68fd0433d83a00f8502dd2055fa5b')

pkgver() {
  cd "${_pkgsrc}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  for _patch in "${srcdir}/${_pkgname}"*".patch"; do
    patch -p1 -i "${_patch}"
  done
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  make
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -Dm755 "bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
}
