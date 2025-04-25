# Maintainer: Axel McLaren <scm(at)axml(dot)uk>

pkgname=poser
_zimk_pkgname=zimk
_zimk_commit=7c5c4f2
pkgver=1.2.2
pkgrel=1
pkgdesc="C framework for POsix SERvices"
arch=('i686' 'x86_64')
license=('BSD')
depends=('openssl' 'git')
makedepends=('pkgconf')
url="https://github.com/Zirias/poser"

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "${_zimk_pkgname}::git+https://github.com/Zirias/${_zimk_pkgname}#commit=${_zimk_commit}")
sha256sums=('d08a3637e1967b04a4e770f381ba0f693c9529e1a4f8c6ff85d803b4482ab25f'
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
