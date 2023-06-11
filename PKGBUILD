# Maintainer: Vlad Glagolev <scm(at)vaygr(dot)net>

pkgname=poser
_zimk_pkgname=zimk
_zimk_commit=348bfe8
pkgver=1.1
pkgrel=1
pkgdesc="C framework for POsix SERvices"
arch=('i686' 'x86_64')
license=('BSD')
depends=('openssl' 'git')
makedepends=('pkgconf')
url="https://github.com/Zirias/poser"

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "${_zimk_pkgname}::git+https://github.com/Zirias/${_zimk_pkgname}#commit=${_zimk_commit}")
sha256sums=('e8c35772401481a335e0227616220e57f4aa63ae2b9ca33a870be1d5d3f3d33c'
            'SKIP')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  mv ../${_zimk_pkgname} .
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}/" prefix="/usr"
}

package() {
  cd "${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}/" prefix="/usr" install

  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
