# Maintainer: Gergely Imreh <imrehg@gmail.com>
# Contributor: Gergely Imreh <imrehg@gmail.com>

pkgname=resin-cli
pkgdesc='Resin.io command line interface'
pkgver=6.6.5
pkgrel=1
arch=('i686' 'x86_64')
url='https://resin.io/'
license=('APACHE')
depends=('nodejs>=6.0.0')
makedepends=('npm')
source=(http://registry.npmjs.org/$pkgname/-/${pkgname}-${pkgver}.tgz)
noextract=(${pkgname}-${pkgver}.tgz)
options=(!strip)
optdepends=('python3: resin-preload')
optdepends_x86_64=('lib32-glibc: emulated builds')
sha256sums=('b3cc1cefe42394b528a7c1452db274c90526775d0cb38f8c030cfeaa84377474')

package() {
  npm install --global --only=production --user root --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"
  rm -r "${pkgdir}/usr/etc"
  find "${pkgdir}" -name "__pycache__" -type d -exec rm -rf '{}' +
}
