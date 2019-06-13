# Maintainer: Jefferson Gonzalez <jgmdev@gmail.com>
# Contributor: Jefferson Gonzalez <jgmdev@gmail.com>

pkgname=kore-git
_gitname=kore
pkgver=3.3.1.r1491
pkgrel=1
pkgdesc="An easy to use, scalable and secure web application framework for writing web APIs in C."
arch=('i686' 'x86_64')
url="https://kore.io/"
license=('ISC')
makedepends=('git')
depends=('openssl' 'postgresql-libs' 'curl' 'yajl')
conflicts=('kore')
provides=('kore')
source=(git://github.com/jorisvink/kore)
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"
  echo $(git tag -l | tail -n1 | sed "s/\-release//g").r$(git rev-list HEAD --count)
}

build() {
  cd "${srcdir}/${_gitname}"

  PREFIX=/usr TASKS=1 PGSQL=1 CURL=1 JSONRPC=1 make
}

package() {
  cd "${srcdir}/${_gitname}"

  make PREFIX="${pkgdir}/usr" install

  mkdir -p "${pkgdir}/usr/share/doc/kore/"
  install -m 644 "${srcdir}/${_gitname}/conf/kore.conf.example" "${pkgdir}/usr/share/doc/kore/"
  install -m 644 "${srcdir}/${_gitname}/README.md" "${pkgdir}/usr/share/doc/kore/"
  cp -r "${srcdir}/${_gitname}/examples" "${pkgdir}/usr/share/doc/kore/"
}
