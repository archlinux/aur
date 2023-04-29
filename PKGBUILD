# Maintainer: Vlad Glagolev <scm(at)vaygr(dot)net>

pkgname=tlsc
_zimk_pkgname=zimk
_zimk_commit=0def4fa
pkgver=1.1
pkgrel=1
pkgdesc="TLS connect daemon"
arch=('i686' 'x86_64')
license=('BSD')
depends=('openssl' 'git')
url="https://github.com/Zirias/tlsc"

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "${_zimk_pkgname}::git+https://github.com/Zirias/${_zimk_pkgname}#commit=${_zimk_commit}")
sha256sums=('b04295f090e6d7e2d78256eb3df547549186c9b3423a0229ba84b5a6ffde2b42'
            'SKIP')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  mv ../${_zimk_pkgname} .
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make prefix="${pkgdir}/usr"
}

package() {
  cd "${pkgname}-${pkgver}"

  make prefix="${pkgdir}/usr" install

  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
