# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

_pkgname=timeline
pkgname=${_pkgname}-git
pkgver=1
pkgrel=2
pkgdesc="A plain-text based distributed social network build on top of git configuration manager"
arch=('any')
url="https://ajdiaz.me/timeline/"
license=('GPLv3')
depends=('bash' 'git')
conflicts=('timeline')
source=("${_pkgname}"::"git+https://github.com/ajdiaz/${_pkgname}.git"
        "${_pkgname}.service")
sha256sums=('SKIP'
            'ef063a64b2e38988cf7b7395161351e537e50719f4d77fa3d180e25b911371fd')

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

  # user service file
  install -D -m644 "${srcdir}/${_pkgname}.service" \
    "${pkgdir}/usr/lib/systemd/user/${_pkgname}.service"

  # binary
  install -D -m755 "tl" "${pkgdir}/usr/bin/tl"  

  # docs
  install -D -m644 README "${pkgdir}/usr/share/doc/${_pkgname}/README"
}
