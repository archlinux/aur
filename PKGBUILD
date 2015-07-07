# Maintainer: Zoltan Tombol <zoltan (dot) tombol (plus) aur (at) gmail (dot) com>

pkgname=varrick
pkgver=0.2.0
pkgrel=1
pkgdesc="A convenient template engine to just 'Do the thing!'"
arch=(any)
url="https://github.com/ztombol/varrick"
license=('GPL3')
depends=('bash' 'sed')
makedepends=('ruby-ronn')
checkdepends=('bats-git')
conflicts=("${pkgname}-git")
source=("https://github.com/ztombol/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('93441b49edfa8529cb3044f7b71e0596e266846054ab8f7d597bc6896d7239119a6806c6cf616c03ffdc478f779404774c7d670d24ace49137c8fa42d2f1799c')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make build
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make -k check
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir/" \
       PREFIX='/usr' \
       LIBEXECDIR='/usr/lib' \
       install
}

# vim:set ts=2 sw=2 et:
