# Maintainer: LinRs <LinRs at users.noreply.github.com>

pkgname=elfeed
pkgver=3.1.0
pkgrel=1
pkgdesc="Emacs web feeds client"
arch=('any')
url="https://github.com/skeeto/elfeed"
license=('custom:unlicnese')
depends=('emacs>=24.3')
optdepends=('curl')
provides=("${pkgname}=${pkgver}")
source=("$pkgname-$pkgver.tar.gz::${url}archive/${pkgver}.tar.gz")
sha256sums=('faf7e7ade781c57e4fb5bd0a3a605b8ceca500c6225c9ae75d2b19b889197b44')

build() {
    cd "${pkgname}-${pkgver}"
    make
}

check() {
    cd "${pkgname}-${pkgver}"
    make -k check
}

package() {
    cd "${pkgname}-${pkgver}"
    install -d "${pkgdir}/usr/share/emacs/site-lisp/${pkgname}"
    cp *.el{,c} *.md "${pkgdir}/usr/share/emacs/site-lisp/${pkgname}"
    install -Dm644 UNLICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
