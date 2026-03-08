# Contributor: Dan Beste <dan.ray.beste@gmail.com>
# Contributor: anekos <anekos@snca.net>
# Maintainer: sonofaglitch <sonofaglitch@mailbox.org>

pkgname=lfe-git
pkgver='r12.539d87c'
pkgrel=1
epoch=1
pkgdesc="Lisp Flavoured Erlang is not a casual Lisp. It's a Lisp for those who want to build distributed applications -- like the Erlang software that powers 40% of the world's telecommunications."
url='https://lfe.io/'
arch=('x86_64')
license=('Apache_v2')
depends=('erlang')
makedepends=('make')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=('git+https://github.com/lfe/lfe.git#branch=develop')
sha512sums=('SKIP')

package () {
  cd "${pkgname%-git}"
  make PREFIX="${pkgdir}/usr" install
  cd "${pkgdir}"/usr/bin
  for link in *; do
    ln -sfv "../lib/lfe/bin/${link}" "${link}"
  done
  rm -rv "${pkgdir}/usr/share/man/cat1"
  rm -rv "${pkgdir}/usr/share/man/cat3"
  rm -rv "${pkgdir}/usr/share/man/cat7"
  rm -v "${pkgdir}/usr/share/man/index.db"
}
