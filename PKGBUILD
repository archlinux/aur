# Maintainer: Vlad Glagolev <scm(at)vaygr(dot)net>

pkgname=tlsc
_zimk_pkgname=zimk
_zimk_commit=0def4fa
pkgver=1.3
pkgrel=1
pkgdesc="TLS connect daemon"
arch=('i686' 'x86_64')
license=('BSD')
depends=('openssl' 'git')
url="https://github.com/Zirias/tlsc"

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "${_zimk_pkgname}::git+https://github.com/Zirias/${_zimk_pkgname}#commit=${_zimk_commit}")
sha256sums=('37bdf6975d099e0481cab1270191254b8527e925e151b1ca94bf790db31b146e'
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
