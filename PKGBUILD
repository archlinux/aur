# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: LinRs <LinRs at users.noreply.github.com>

pkgname=elfeed
pkgver=3.3.0
pkgrel=1
pkgdesc="Emacs web feeds client"
arch=('any')
url="https://github.com/skeeto/elfeed"
license=('custom:unlicense')
depends=('emacs>=24.3' 'curl')
provides=("${pkgname}=${pkgver}")
source=("${pkgname}-${pkgver}.tar.gz"::"${url}/archive/${pkgver}.tar.gz")
sha256sums=('3250520b72c693b4b88becda37748f76e76afbdb5b45ce077cdca35578cee9eb')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make -k check || true
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -d "${pkgdir}/usr/share/emacs/site-lisp/${pkgname}"
  cp *.el{,c} *.md "${pkgdir}/usr/share/emacs/site-lisp/${pkgname}"
  install -Dm644 UNLICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
