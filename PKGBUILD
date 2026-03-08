# Maintainer: sonofaglitch <sonofaglitch@mailbox.org>
pkgname=lfe
pkgver=2.2.0
pkgrel=3
pkgdesc="Lisp Flavoured Erlang is not a casual Lisp. It's a Lisp for those who want to build distributed applications -- like the Erlang software that powers 40% of the world's telecommunications."
arch=('x86_64')
url="https://lfe.io/"
url_src="https://github.com/lfe/lfe"
license=('Apache')
depends=('erlang')
makedepends=('make')
conflicts=("${pkgname}-git")
provides=("${pkgname}")
source=("${pkgname}-${pkgver}.tar.gz::${url_src}/archive/${pkgver}.tar.gz")
sha512sums=('029cbc638f1c125fbb9053de5f7bb1d261575e6f390e38133f34d3bc6f2905c4d8aab7c8cdff5ba67ddbdfcd6546e37c66924104e8d825247513dee829a170df')

package() {
  cd "${pkgname}-${pkgver}"
  make PREFIX="${pkgdir}/usr" install
  cd "${pkgdir}"/usr/bin
  for link in *; do
    ln -fs "../lib/lfe/bin/${link}" "${link}"
  done
  rm -rv "${pkgdir}/usr/share/man/cat1"
  rm -rv "${pkgdir}/usr/share/man/cat3"
  rm -rv "${pkgdir}/usr/share/man/cat7"
  rm -v "${pkgdir}/usr/share/man/index.db"
}
