# Contributor: Dan Beste <dan.ray.beste@gmail.com>
# Contributor: anekos <anekos@snca.net>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=lfe-git
pkgver='r11.50f3ec4'
pkgrel=1
epoch=1
pkgdesc="Lisp Flavoured Erlang"
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
