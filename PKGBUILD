# Maintainer: Jose Riha <jose1711 gmail com>
# Maintainer: Samuel Braun <dr.br web de>

_pkgname=lssecret
pkgname=${_pkgname}-git
pkgver=r10.20fd771
pkgrel=4
pkgdesc="utility to list all secret items in a secret service using libsecret"
arch=('i686' 'x86_64')
url="https://gitlab.com/GrantMoyer/lssecret"
license=('Unlicense')
depends=('libsecret')
makedepends=('git')
conflicts=(${_pkgname})
provides=(${_pkgname})
source=("git+https://gitlab.com/GrantMoyer/lssecret.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/$_pkgname"
  make
}

package() {
  cd "${srcdir}/$_pkgname"
  make DESTDIR="${pkgdir}/usr" install
  chmod 755 "${pkgdir}/usr/bin/lssecret" 
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
}
