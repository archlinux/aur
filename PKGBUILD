# Maintainer: petRUShka <petrushkin[dot]yandex[at]ru>

_pkgname='huaweicalc'
pkgname="${_pkgname}-git"
pkgver=r19.20190705.91911fe
pkgrel=0.5
pkgdesc='Huawei modem unlock code calculator.'
arch=('i686' 'x86_64')
url="https://github.com/forth32/huaweicalc"
license=('GPL3')
depends=(
  'qt5-base'
)
makedepends=(
  'git'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=()

source=("${_pkgname}::git+https://github.com/forth32/huaweicalc.git")
sha256sums=('SKIP')


pkgver() {
  cd "${srcdir}/${_pkgname}"

  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_rev}" ]; then
    error "Git commit count could not be determined."
    return 1
  else
    printf '%s' "r${_rev}.${_date}.${_hash}"
  fi
}


build() {
  cd "${srcdir}/${_pkgname}"

  qmake
  make
}

package() {
  cd "${srcdir}/${_pkgname}"

  install -D -v -m755 huaweicalc "${pkgdir}/usr/bin/${_pkgname}"

  install -D -v -m644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"

  install -D -v -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
