# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: LinRs <LinRs at users.noreply.github.com>

pkgname=elfeed
pkgver=3.4.1
pkgrel=1
pkgdesc="Emacs web feeds client"
arch=('any')
url="https://github.com/skeeto/elfeed"
license=('custom:unlicense')
depends=('emacs>=24.3' 'curl')
provides=("${pkgname}=${pkgver}")
source=("${pkgname}-${pkgver}.tar.gz"::"${url}/archive/${pkgver}.tar.gz")
sha256sums=('d1941120b3269fef7a07a9eea648147384df6b2e5c324675ef1fc63ae52d8a6e')

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
