# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

_pkgname=timeline
pkgname=${_pkgname}-git
pkgver=1
pkgrel=1
pkgdesc="A plain-text based distributed social network build on top of git configuration manager"
arch=('any')
url="https://ajdiaz.me/timeline/"
license=('GPLv3')
depends=('bash' 'git')
source=("${_pkgname}"::"git+https://github.com/ajdiaz/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${_pkgname}"
  make clean && make
}

package() {
  cd "${_pkgname}"

  # binary
  install -D -m755 "tl" "${pkgdir}/usr/bin/tl"  

  # docs
  install -D -m644 README "${pkgdir}/usr/share/doc/${_pkgname}/README"
}
