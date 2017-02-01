# Maintainer: Jefferson Gonzalez <jgmdev@gmail.com>
# Contributor: Jefferson Gonzalez <jgmdev@gmail.com>

pkgname=kore-git
_gitname=kore
pkgver=2.0.0.release.r80.g261fb3c
pkgrel=1
pkgdesc="An easy to use, scalable and secure web application framework for writing web APIs in C."
arch=('i686' 'x86_64')
url="https://kore.io/"
license=('ISC')
depends=('openssl' 'postgresql-libs')
conflicts=('kore')
provides=('kore')
source=(git://github.com/jorisvink/kore)
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"
  git describe --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_gitname}"

  PREFIX=/usr TASKS=1 PGSQL=1 make
}

package() {
  cd "${srcdir}/${_gitname}"

  make INSTALL_DIR="${pkgdir}/usr/bin" INCLUDE_DIR="${pkgdir}/usr/include/kore" install

  mkdir -p "${pkgdir}/usr/share/doc/kore/"
  install -m 644 "${srcdir}/${_gitname}/conf/kore.conf.example" "${pkgdir}/usr/share/doc/kore/"
  install -m 644 "${srcdir}/${_gitname}/README.md" "${pkgdir}/usr/share/doc/kore/"
  cp -r "${srcdir}/${_gitname}/examples" "${pkgdir}/usr/share/doc/kore/"
}