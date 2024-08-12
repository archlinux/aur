# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: LinRs <LinRs at users.noreply.github.com>

pkgname=elfeed
pkgver=3.4.2
pkgrel=1
pkgdesc="Emacs web feeds client"
arch=('any')
url="https://github.com/skeeto/elfeed"
license=('custom:unlicense')
depends=('emacs>=24.3' 'curl')
provides=("${pkgname}=${pkgver}")
source=("${pkgname}-${pkgver}.tar.gz"::"${url}/archive/${pkgver}.tar.gz")
sha256sums=('bf062221aee4cd9fbbf019157bf781a5694a8a52589de5045c108446ec995f34')

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
